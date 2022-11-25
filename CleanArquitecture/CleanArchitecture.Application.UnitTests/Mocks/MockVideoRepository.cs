using AutoFixture;
using CleanArchitecture.Domain;
using CleanArchitecture.Infraestructure.Persistence;
using CleanArchitecture.Infraestructure.Repositories;
using Microsoft.EntityFrameworkCore;
using Moq;

namespace CleanArchitecture.Application.UnitTests.Mocks
{
    public static class MockVideoRepository
    {
        public static void AddDataVideoRepository(StreamerDbContext streamerDbContextFake)
        {
            var fixture = new Fixture();
            // Eliminar error referencia circular
            fixture.Behaviors.Add(new OmitOnRecursionBehavior());

            var videos = fixture.CreateMany<Video>().ToList();

            // Agregar valor personalizado
            videos.Add(fixture.Build<Video>()
                .With(tr => tr.CreatedBy, "codemvs")
                .Create()
                );

            //Configuracion bd en memoria
            //var options = new DbContextOptionsBuilder<StreamerDbContext>()
            //    .UseInMemoryDatabase(databaseName: $"StramerDbContext-{Guid.NewGuid()}")
            //    .Options;

            // Crear instacia EF
            //var stramerDbContextFake = new StreamerDbContext(options);
            //Agregar data
            streamerDbContextFake.Videos.AddRange(videos);
            //Almacenar db temp
            streamerDbContextFake.SaveChanges();



            // var mockReposiroty = new Mock<IVideoRepository>();
            //var mockReposiroty = new Mock<VideoRepository>(stramerDbContextFake);
            //mockReposiroty.Setup(r => r.GetAllAsync()).ReturnsAsync(videos);
            //return mockReposiroty;
        }
    }
}
