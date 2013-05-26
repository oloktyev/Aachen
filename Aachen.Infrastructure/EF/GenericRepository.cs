using System;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using Aachen.Core.Base;
using Aachen.Core.Interfaces.Repositories;
using System.Collections.Generic;

namespace Aachen.Core.EF.Repositories
{
    public class GenericRepository<T, TId> : IRepository<T, TId> where T : Entity<TId>
    {
        protected DbContext DbContext { get; set; }
        protected DbSet<T> DbSet { get; set; }

        public GenericRepository(DbContext dbContext)
        {
            if (dbContext == null) 
                throw new ArgumentNullException("dbContext");
            DbContext = dbContext;
            DbSet = DbContext.Set<T>();
        }

        #region IRepository<T,TId> Members

        public virtual IQueryable<T> GetAll()
        {
            return DbSet.AsQueryable();
        }

        public virtual T Get(TId id)
        {
            return DbSet.Find(id);
        }

        public virtual T Add(T entity)
        {
            DbEntityEntry dbEntityEntry = DbContext.Entry(entity);
            if (dbEntityEntry.State != EntityState.Detached)
            {
                dbEntityEntry.State = EntityState.Added;
            }
            else
            {
                DbSet.Add(entity);
            }
            return entity;
        }

        public virtual void AddMany(IList<T> entities)
        {
            foreach (var entity in entities)
            {
                Add(entity);
            }
        }

        public virtual T Update(T entity)
        {
            DbEntityEntry dbEntityEntry = DbContext.Entry(entity);
            if (dbEntityEntry.State == EntityState.Detached)
            {
                DbSet.Attach(entity);
            }  
            dbEntityEntry.State = EntityState.Modified;
            return entity;
        }

        public virtual void Delete(T entity)
        {
            DbEntityEntry dbEntityEntry = DbContext.Entry(entity);
            if (dbEntityEntry.State != EntityState.Deleted)
            {
                dbEntityEntry.State = EntityState.Deleted;
            }
            else
            {
                DbSet.Attach(entity);
                DbSet.Remove(entity);
            }
        }

        public virtual void Delete(TId id)
        {
            var entity = Get(id);
            if (entity == null) return; // not found; assume already deleted.
            Delete(entity);
        }

        #endregion
    }
}
