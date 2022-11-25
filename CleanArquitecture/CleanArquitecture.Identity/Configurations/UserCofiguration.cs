using CleanArchitecture.Identity.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CleanArchitecture.Identity.Configurations
{
    internal class UserCofiguration : IEntityTypeConfiguration<ApplicationUser>
    {
        public void Configure(EntityTypeBuilder<ApplicationUser> builder)
        {
            var hasher = new PasswordHasher<ApplicationUser>();
            builder.HasData(
                new ApplicationUser()
                {
                    Id = "96b7811b-b6fa-4a09-b593-3a8d28ab4993",
                    Email = "admin@localhost.com",
                    NormalizedEmail = "admin@localhost.com",
                    Nombre = "Codemvs",
                    Apellidos = "Code",
                    UserName = "codemvs",
                    NormalizedUserName = "codemvs",
                    PasswordHash = hasher.HashPassword(null, "Codemvs*123"),
                    EmailConfirmed = true
                },
                new ApplicationUser()
                {
                    Id = "67911260-a222-4d97-8942-dbe864a79009",
                    Email = "test@localhost.com",
                    NormalizedEmail = "test@localhost.com",
                    Nombre = "test",
                    Apellidos = "test",
                    UserName = "test",
                    NormalizedUserName = "test",
                    PasswordHash = hasher.HashPassword(null, "Test*123"),
                    EmailConfirmed = true
                }
                );
        }
    }
}
