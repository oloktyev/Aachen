using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Aachen.Core.EF.Repositories;
using Aachen.Core.Interfaces;
using Aachen.Core.Interfaces.Repositories;
using System.Data.Entity;
using Aachen.Core.Model;
using Aachen.Infrastructure.EF;
using System.Data.Objects;

namespace Aachen.Core.EF
{
    public class EfUnitOfWork : IUnitOfWork
    {
        private DbContext DbContext { get; set; }
        public EfUnitOfWork()
        {
            DbContext = new AachenDbContext();
        }

        public IJokeRepository Jokes { get { return new JokeRepository(DbContext); } }
        public IRepository<Resource, int> Resources { get { return new GenericRepository<Resource, int>(DbContext); } }
        public IRepository<ResourceProcessingRule, int> ResourceProcessingRule { get { return new GenericRepository<ResourceProcessingRule, int>(DbContext); } }

        public void CommitChanges()
        {
            DbContext.SaveChanges();
        }
    }
}
