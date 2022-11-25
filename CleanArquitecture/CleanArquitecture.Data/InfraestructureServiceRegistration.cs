using CleanArchitecture.Application.Contracts.Infrastructure;
using CleanArchitecture.Application.Contracts.Persistence;
using CleanArchitecture.Application.Models;
using CleanArchitecture.Infraestructure.Email;
using CleanArchitecture.Infraestructure.Persistence;
using CleanArchitecture.Infraestructure.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace CleanArchitecture.Infraestructure
{
    public static class InfraestructureServiceRegistration
    {
        public static IServiceCollection AddInfraestructureServices(this IServiceCollection services,
            IConfiguration configuration)
        {
            services.AddDbContext<StreamerDbContext>(options => 
                options.UseSqlServer(configuration.GetConnectionString("ConnectionString"))
            );
            //Unit of Work
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            //Operaciones por defautl
            services.AddScoped(typeof(IAsyncRepository<>), typeof(RepositoryBase<>));
            // Operaciones personalizadas
            services.AddScoped<IVideoRepository, VideoRepository>();
            services.AddScoped<IStreamerRepository, StreamerRepository>();

            services.Configure<EmailSettings>(c => configuration.GetSection("EmailSettings"));            
            services.AddTransient<IEmailService, EmailService>();

            return services;

        }
    }
}
