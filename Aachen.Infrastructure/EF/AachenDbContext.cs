using System.Data.Entity.ModelConfiguration.Conventions;
using System.Data.Entity;
using Aachen.Core.Model;

namespace Aachen.Infrastructure.EF
{
    class AachenDbContext : DbContext
    {
        public AachenDbContext()
            : base("Aachen") { }

        public DbSet<Joke> Jokes { get; set; }
        public DbSet<Resource> Resources { get; set; }
        public DbSet<ResourceType> ResourceTypes { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            // Use singular table names
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

            // Joke

            modelBuilder.Entity<Joke>()
                .HasKey(x => x.Id)
                .Property(x => x.Id)
                .HasColumnName("JokeId");

            modelBuilder.Entity<Joke>()
                .HasRequired(x => x.Resource)
                .WithMany()
                .Map(a => a.MapKey("ResourceId"));

            // Resource

            modelBuilder.Entity<Resource>()
                .HasKey(x => x.Id)
                .Property(x => x.Id)
                .HasColumnName("ResourceId");

            modelBuilder.Entity<Resource>()
                .Property(x => x.Name)
                .HasMaxLength(100);

            modelBuilder.Entity<Resource>()
                        .Property(x => x.Url)
                        .HasMaxLength(200);

            modelBuilder.Entity<Resource>()
                .HasRequired(x => x.Type)
                .WithMany()
                .Map(a => a.MapKey("TypeId"));

            // ResourceType

            modelBuilder.Entity<ResourceType>()
                .HasKey(x => x.Id)
                .Property(x => x.Id)
                .HasColumnName("ResourceTypeId");

            modelBuilder.Entity<ResourceType>()
                        .Property(x => x.Name)
                        .HasMaxLength(50);

            // ResourceProcessingRule

            modelBuilder.Entity<ResourceProcessingRule>()
                .HasKey(x => x.Id)
                .Property(x => x.Id)
                .HasColumnName("ResourceProcessingRuleId");

            modelBuilder.Entity<ResourceProcessingRule>()
                .HasRequired(x => x.Resource)
                .WithMany(x => x.Rules)
                .Map(a => a.MapKey("ResourceId"));

            

        }
    }
}
