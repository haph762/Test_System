using API._Repositories.Interfaces;
using API.Data;
using API.Models;

namespace API._Repositories.Repositories
{
    public class User_Repository : Repository<Users>, IUsers_Repository
    {
        private DBContext _context;
        public User_Repository(DBContext context) : base(context)
        {
            _context = context;
        }
    }
}