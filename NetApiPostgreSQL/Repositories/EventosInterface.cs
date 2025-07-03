using NetApiPostgreSQL.Models;

namespace NetApiPostgreSQL.Repositories
{
    public interface EventosInterface
    {
        Task<IEnumerable<Models.Evento>> GetAll();
        Task<Models.Evento> GetEvento(Guid id);
        Task<bool> InsertEvento(Evento evento);
        Task<bool> UpdateEvento(Evento evento);
        Task<bool> DeleteEvento(Guid id);
    }
}
