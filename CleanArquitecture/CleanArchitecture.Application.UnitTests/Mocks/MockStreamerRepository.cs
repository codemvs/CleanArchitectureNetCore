using AutoFixture;
using CleanArchitecture.Domain;
using CleanArchitecture.Infraestructure.Persistence;

namespace CleanArchitecture.Application.UnitTests.Mocks
{
    public static class MockStreamerRepository
    {
        public static void AddDataStreamerRepository(StreamerDbContext streamerDbContextFake)
        {
            var fixture = new Fixture();
            // Eliminar error referencia circular
            fixture.Behaviors.Add(new OmitOnRecursionBehavior());

            var steamers = fixture.CreateMany<Streamer>().ToList();

            // Agregar valor personalizado
            steamers.Add(fixture.Build<Streamer>()
                .With(tr => tr.Id, 8001)
                .Without(tr => tr.Videos)
                .Create()
                );

            //Agregar data
            streamerDbContextFake.Streamers.AddRange(steamers);
            //Almacenar db temp
            streamerDbContextFake.SaveChanges();

        }
    }
}
