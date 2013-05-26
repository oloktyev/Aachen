using Aachen.Core.DTO;
using Aachen.Core.Model;
using System;
using System.Collections.Generic;

namespace Aachen.Core.Interfaces.Repositories
{
    public interface IJokeRepository : IRepository<Joke, long>
    {
        IList<LatestJokesDTO> GetLatestJokes();
    }
}
