using API._Repositories.Interfaces;
using API.Data;
using API.Models;

namespace API._Repositories.Repositories
{
    public class Roles_Repository : Repository<Roles>, IRoles_Repository
    {
        private DBContext _context;
        public Roles_Repository(DBContext context) : base(context)
        {
            _context = context;
        }
    }
}