using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Aachen.Core.DTO;
using Aachen.Core.Interfaces.Repositories;
using Aachen.Core.EF.Repositories;
using Aachen.Core.Model;
using System.Data.Entity;

namespace Aachen.Infrastructure.EF
{
    public class JokeRepository : GenericRepository<Joke, long> , IJokeRepository
    {
        public JokeRepository(DbContext dbContext)
            : base(dbContext)
        {

        }

        public IList<LatestJokesDTO> GetLatestJokes()
        {
            var latestJokes = DbContext.Database.SqlQuery<LatestJokesDTO>(
                       @"WITH 
	                        LatestJokes 
                        AS
	                        (
	                           SELECT [Description],[ResourceId],
			                         ROW_NUMBER() OVER (PARTITION BY [ResourceId] ORDER BY [CreatedDate] DESC) AS rn
	                           FROM [dbo].[Joke]
	                        )
                        SELECT [ResourceId], [Description]
                        FROM 
	                        LatestJokes
                        WHERE 
	                        rn = 1").ToList();
            return latestJokes;
        }

        public void RemoveDuplicates()
        {
            DbContext.Database.ExecuteSqlCommand(
                       @"WITH numbered AS 
                        ( 
                             SELECT Description, row_number() OVER ( PARTITION BY Hash ORDER BY CreatedDate ASC) AS RN 
                             FROM     [Joke]
                        )
                        delete FROM numbered WHERE RN > 1");
        }
    }
}
