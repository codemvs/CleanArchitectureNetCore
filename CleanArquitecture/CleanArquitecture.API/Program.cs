using CleanArchitecture.API.Middleware;
using CleanArchitecture.Application;
using CleanArchitecture.Identity;
using CleanArchitecture.Infraestructure;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Configuracion instancias
builder.Services.AddInfraestructureServices(builder.Configuration);
builder.Services.AddApplicationServices();
builder.Services.ConfigureIdentityService(builder.Configuration);

//Configuracion Cors
builder.Services.AddCors(options => {
    options.AddPolicy("CorsPolicy",
        builder => builder.AllowAnyOrigin()
        .AllowAnyMethod()
        .AllowAnyHeader()
    );
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
//Middleware
app.UseMiddleware<ExceptionMiddleware>();
// Configuracion authenticacion
app.UseAuthentication();
app.UseAuthorization();
//Useo de Cors
app.UseCors("CorsPolicy");

app.MapControllers();

app.Run();
