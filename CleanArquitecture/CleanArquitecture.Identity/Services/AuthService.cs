using CleanArchitecture.Application.Constants;
using CleanArchitecture.Application.Contracts.Identity;
using CleanArchitecture.Application.Models.Identity;
using CleanArchitecture.Identity.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace CleanArchitecture.Identity.Services
{
    public class AuthService : IAuthService
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _singManager;
        private readonly JwtSettings _jwtSettings;

        public AuthService(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> singManager, IOptions<JwtSettings> jwtSettings)
        {
            _userManager = userManager;
            _singManager = singManager;
            _jwtSettings = jwtSettings.Value;
        }

        public async Task<AuthResponse> Login(AuthRequest request)
        {            
            var user = await _userManager.FindByEmailAsync(request.Email);
            if (user == null)
            {
                throw new Exception($"El usuario con email {request.Email}  no existe");
            }
            /*
             (username, password,
            persistente:false, - Persistente
            lockoutOnFailure:false - que no bloque el usuario en caso de errores
            )
             */
            var result = await _singManager.PasswordSignInAsync(user.UserName, request.Password, false, lockoutOnFailure: false);
            if (!result.Succeeded)
            {
                throw new Exception($"Las credenciales son incorrectas");
            }

            var tokenGenerated = await GenerateToken(user);

            var authResponse = new AuthResponse
            {
                Id = user.Id,
                Token = new JwtSecurityTokenHandler().WriteToken(tokenGenerated),
                Email = user.Email,
                UserName = user.UserName
            };

            return authResponse;
            
        }

        public async Task<RegistrationResponse> Register(RegistrationRequest request)
        {
            var existingUser = await _userManager.FindByNameAsync(request.UserName);
            if(existingUser != null)
            {
                throw new Exception($"El username ya fue tomado por otra cuenta");
            }

            var existingEmail = await _userManager.FindByEmailAsync(request.Email);
            if(existingEmail != null)
            {
                throw new Exception($"El email ya fue tomado por otra cuenta");
            }

            var user = new ApplicationUser
            {
                Email = request.Email,
                Nombre = request.Nombre,
                Apellidos = request.Apellidos,
                UserName = request.UserName,
                EmailConfirmed = true
            };
            var result = await _userManager.CreateAsync(user, request.Password);
            if (result.Succeeded)
            {
                await _userManager.AddToRoleAsync(user, "Operator");

                var tokenGenerated = await GenerateToken(user);
                return new RegistrationResponse
                {
                    Email = user.Email,
                    Token = new JwtSecurityTokenHandler().WriteToken(tokenGenerated),
                    UserId = user.Id,
                    UserName = user.UserName
                };
            }

            throw new Exception($"{result.Errors}");
        }
        private async Task<JwtSecurityToken> GenerateToken(ApplicationUser user)
        {
            var userClaims = await _userManager.GetClaimsAsync(user);
            var roles = await _userManager.GetRolesAsync(user);
            
            // Add role
            var roleClaims = new List<Claim>();
            foreach(var role in roles)
            {
                roleClaims.Add(new Claim(ClaimTypes.Role, role));
            }

            // Add data
            var claims = new[] {
                //new Claim("username", user.UserName)
                new Claim(JwtRegisteredClaimNames.Sub, user.UserName),
                new Claim(JwtRegisteredClaimNames.Email, user.UserName),
                new Claim(CustomClaimTypes.Uid, user.Id)
            }.Union(userClaims)
            .Union(roleClaims);

            var symetricSecurityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(
                _jwtSettings.Key // palabra clave de seguridad
                ));
            var signingCredentials = new SigningCredentials(symetricSecurityKey, SecurityAlgorithms.HmacSha256);

            var jwtSecurityToke = new JwtSecurityToken(
                issuer:_jwtSettings.Issuer,
                audience : _jwtSettings.Audience,
                claims: claims,
                expires: DateTime.UtcNow.AddMinutes(_jwtSettings.DurationInMinutes),
                signingCredentials:signingCredentials
                );

            return jwtSecurityToke;
        }
    }
}
