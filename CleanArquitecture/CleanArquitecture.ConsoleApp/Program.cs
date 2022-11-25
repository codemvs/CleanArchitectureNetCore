using CleanArquitecture.Data;
using CleanArquitecture.Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

namespace CleanArquitecture.ConsoleApp
{
    public class Program
    {
        private StreamerDbContext dbContext;
        public Program() {
            dbContext = new StreamerDbContext();
            MultipleEntitiesQuery();
            //AddNewDirectorWithVideo();
            //AddNewActorWithVideo();
            //AddNewStreamerWithVideoID();
            //AddNewStreamerWithVideo();
            //CreateStreamer();
            //CreateStreamerAndVideos();
            //QueryFilter();
            //QueryMethods();
            //QueryLinq();
            //TrakingAndNotTraking();
        }
        public async void MultipleEntitiesQuery() {
            //var videoWhitActores = await dbContext.Videos
            //    .Include(x => x.Actores)
            //    .FirstOrDefaultAsync(x => x.Id == 1);

            //var actor = dbContext.Actores.Select(x => x.Nombre).ToListAsync();
            var videoWhithDirector = await dbContext.Videos
                .Where(x => x.Director != null)
                .Include(x => x.Director)
                .Select(v => new {
                    DirectorMi =$"{v.Director.Nombre} {v.Director.Apellido}",
                    Movie = v.Nombre
                }).ToListAsync();

            foreach (var movie in videoWhithDirector) {
                Console.WriteLine($"{movie.Movie} | {movie.DirectorMi}");
            }
        }
        public async void AddNewDirectorWithVideo() 
        {
            var director = new Director()
            {
                Nombre = "Lorenzo",
                Apellido = "Basteri",
                VideoId = 1
            };

            await dbContext.AddAsync(director);
            await dbContext.SaveChangesAsync();
        }
        public async void AddNewActorWithVideo() {
            var actor = new Actor() { 
                Nombre = "Merry",
                Apellido ="Jane"
            };

            await dbContext.AddAsync(actor);
            await dbContext.SaveChangesAsync();

            var videoActor = new VideoActor() { 
                ActorId = actor.Id,
                VideoId = 1
            };

            await dbContext.AddAsync(videoActor);
            await dbContext.SaveChangesAsync();
        }
        public async void AddNewStreamerWithVideoID() {
            
            var batmanForever = new Video { 
                Nombre = "Las ardillitas" 
                ,StreamerId = 3
            };
            await dbContext.AddAsync(batmanForever);
            await dbContext.SaveChangesAsync();

        }
        public async void AddNewStreamerWithVideo()
        {
            var pantaya = new Streamer
            {
                Nombre = "Pantaya"
            };
            var hugerGames = new Video
            {
                Nombre = "Huger Games"
                ,
                Streamer = pantaya
            };
            await dbContext.AddAsync(hugerGames);
            await dbContext.SaveChangesAsync();

        }
        private async void TrakingAndNotTraking()
        {
            // AsNoTracking -> Está por default, una vez que se realiza la consulta los cambios se mantienen en memoria para
            // para la siguiente transacción
            var streamerWhitTraking = await dbContext.Streamers.FirstOrDefaultAsync(x => x.Id == 1);

            //AsNoTracking -> Permite realizar consultas a la base dedatos que no requieren ser modificado el valor en la BD
            var streamerWhitNotTraking = await dbContext.Streamers.AsNoTracking().FirstOrDefaultAsync(x => x.Id == 2);

            streamerWhitTraking.Nombre = "Netflix Super";
            streamerWhitNotTraking.Nombre = "Amazon Plus";
            await dbContext.SaveChangesAsync();
        }

        private async void QueryLinq()
        {
            string valor = "n";
            var streamers =await (from i in dbContext.Streamers
                                  where EF.Functions.Like(i.Nombre,$"%{valor}%")
                                  select i).ToListAsync();
            foreach (var streamer in streamers) {
                Console.WriteLine($"{streamer.Id} - {streamer.Nombre}");
            }
        }

        private async void QueryMethods()
        {
            var streamer = dbContext.Streamers;
            // En caso de no encontrar coincidencias para retornar un valor, ocurrira una excepcion
            var stramersFirst =await streamer.Where(x => x.Nombre.Contains("a")).FirstAsync();
            // En caso de no encontrar coincidencias para retornar un valor, retornara null
            var stramersFirstOrDefault = await streamer.Where(x => x.Nombre.Contains("a")).FirstOrDefaultAsync();
            //Obtiene el primer registro de la condicion sin hacer where
            var stramersFirstOrDefaultDirect = await streamer.FirstOrDefaultAsync(x => x.Nombre.Contains("a"));
            // Devolver un solo registro, el resultado debe de ser un único valor, si el resultado es una coleccion ocurrira una excepcion
            var singleAsync = await streamer.Where(x => x.Id == 1).SingleAsync();
            // Devolver un solo registro, el resultado debe de ser un único valor, si el resultado no existe devolvera null
            var singleOrDefaultAsync = await streamer.Where(x => x.Id == 1).SingleOrDefaultAsync();
            // Permite buscar un registro por su Id
            var result = await streamer.FindAsync(1);


        }

        private async void QueryFilter()
        {
            string streamerName = "Amazon";

            Log("Streamers (==) ");
            var streamers = await dbContext.Streamers
                .Where(x => x.Nombre == streamerName)
                .ToListAsync();            
            ShowStreamers(streamers);

            Log("Streamers (Equals) ");
            var stramerEquals = await dbContext.Streamers
                .Where(x => x.Nombre.Equals(streamerName))
                .ToListAsync();            
            ShowStreamers(stramerEquals);

            Log("Streamers Contains");
            var stramerContains = await dbContext.Streamers
                .Where(x => x.Nombre.Contains(streamerName))
                .ToListAsync();
            ShowStreamers(stramerContains);

            Log("Stramers EF.Funcions.Like");
            var stramersLike = await dbContext.Streamers
                .Where(x => EF.Functions.Like(x.Nombre,$"%{streamerName}%"))
                .ToListAsync();
            ShowStreamers(stramersLike);

        }
        private void ShowStreamers(List<Streamer> streamers) {
            foreach (var streamer in streamers)
            {
                Console.WriteLine($"{streamer.Id} - {streamer.Nombre}");
            }
        }

        private async void CreateStreamer() {            
            
            Streamer streamer = new Streamer()
            {
                Nombre = "Netflix",
                Url = "https://netflix.com"
            };
            dbContext.Streamers.Add(streamer);
            Log("Agregr streaner");
            await dbContext.SaveChangesAsync();
            Log("Resulto OK");
        }
        private async void CreateStreamerAndVideos()
        {
            Streamer streamer = new Streamer()
            {
                Nombre = "Amazon",
                Url = "https://amazon.com"
            };
            dbContext.Streamers.Add(streamer);
            Log("Agregr streaner");
            await dbContext.SaveChangesAsync();
            Log("Resulto OK");

            Log("Creando lista de videos");
            List<Video> videos = new List<Video>() { 
                new Video(){
                    Nombre = "Spiderman Regreso a casa",
                    StreamerId = streamer.Id
                },
                new Video(){ 
                    Nombre="La momia regresa",
                    StreamerId = streamer.Id
                },
                new Video(){
                    Nombre = "Dragon Ball Super Hero",
                    StreamerId = streamer.Id
                }
            };
            Log("Agregando lista de videos al context");
            await dbContext.Videos.AddRangeAsync(videos);
            await dbContext.SaveChangesAsync();
            Log("Ok add videos");

        }
        static void Main(string[] args)
        {
            new Program();
            Console.ReadKey();
        }
        private void Log(string mensaje) {
            Console.WriteLine(mensaje);
        }
    }
}
