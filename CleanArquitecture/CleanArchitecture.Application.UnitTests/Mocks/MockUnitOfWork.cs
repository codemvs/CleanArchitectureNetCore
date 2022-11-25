using CleanArchitecture.Application.Contracts.Persistence;
using CleanArchitecture.Infraestructure.Persistence;
using CleanArchitecture.Infraestructure.Repositories;
using Microsoft.EntityFrameworkCore;
using Moq;

namespace CleanArchitecture.Application.UnitTests.Mocks
{
    public static class MockUnitOfWork
    {
        public static Mock<UnitOfWork> GetUnitOfWork()
        {
            //Configuracion bd en memoria
            var options = new DbContextOptionsBuilder<StreamerDbContext>()
                .UseInMemoryDatabase(databaseName: $"StramerDbContext-{Guid.NewGuid()}")
                .Options;

            

            // Crear instacia EF
            var straemerDbContextFake = new StreamerDbContext(options);

            // La base de datos debe estar limpia
            straemerDbContextFake.Database.EnsureDeleted();

            var mockUnitOfWork = new Mock<UnitOfWork>(straemerDbContextFake);
            
            //var mockVideoRepository = MockVideoRepository.GetVideoRepository();

            //mockUnitOfWork.Setup(r => r.VideoRepository).Returns(mockVideoRepository.Object);
            return mockUnitOfWork;
        }
    }
}
