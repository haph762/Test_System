using API._Repositories.Interfaces;
using API.Data;
using API.Models;

namespace API._Repositories.Repositories
{
    public class T_EDI_INBOUND_Repository : Repository<T_EDI_INBOUND>, IT_EDI_INBOUND_Repository
    {
        private DBContext _context;
        public T_EDI_INBOUND_Repository(DBContext context) : base(context)
        {
            _context = context;
        }
    }
}