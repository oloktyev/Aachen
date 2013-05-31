using Aachen.Core.Interfaces.Repositories;
using Aachen.Core.Model;

namespace Aachen.Core.Interfaces
{
    public interface IUnitOfWork
    {
        IJokeRepository Jokes { get; }
        IRepository<Resource, int> Resources { get; }
    	IRepository<Category, byte> Categories { get; }
        IRepository<ResourceProcessingRule, int> ResourceProcessingRule { get; }

        void CommitChanges();
    }
}
