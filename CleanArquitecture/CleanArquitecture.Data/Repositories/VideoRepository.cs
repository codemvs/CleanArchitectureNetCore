using CleanArchitecture.Application.Contracts.Persistence;
using CleanArchitecture.Domain;
using CleanArchitecture.Infraestructure.Persistence;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CleanArchitecture.Infraestructure.Repositories
{
    public class VideoRepository : RepositoryBase<Video>, IVideoRepository
    {        
        public VideoRepository(StreamerDbContext context) : base(context)
        {
        }

        public async Task<Video> GetVideoByName(string nameVideo)
        {
            return await _context.Videos!
                .Where(v => v.Nombre == nameVideo)
                .FirstOrDefaultAsync();            
        }

        public async Task<IEnumerable<Video>> GetVideoByUserName(string username)
        {
            return await _context.Videos!
                .Where(v => v.CreatedBy == username)
                .ToListAsync();
        }
    }
}
