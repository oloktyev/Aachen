using System.Collections.Generic;
using System.Linq;

namespace Aachen.Core.Interfaces.Repositories
{
    public interface IRepository<T, in TId>
    {
        T Get(TId id);

        IQueryable<T> GetAll();

        T Add(T entity);

        void AddMany(IList<T> entities);

        T Update(T entity);

        void Delete(T entity);
    }
}
