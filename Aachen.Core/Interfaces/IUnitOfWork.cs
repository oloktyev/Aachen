using Aachen.Core.Interfaces.Repositories;
using Aachen.Core.Model;

namespace Aachen.Core.Interfaces
{
    public interface IUnitOfWork
    {
        IRepository<Joke, long> Jokes { get; }
        IRepository<Resource, int> Resources { get; }
        IRepository<ResourceProcessingRule, int> ResourceProcessingRule { get; }

        void CommitChanges();
    }
}
