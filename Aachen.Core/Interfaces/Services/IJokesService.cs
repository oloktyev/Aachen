using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Aachen.Core.Model;

namespace Aachen.Core.Interfaces.Services
{
    public interface IJokesService
    {
        Joke GetLast(int resourceId);

        IQueryable<Joke> GetJokesForPage(int pageNumber, int pageSize);

        IList<Joke> AddNewJokes();
    }
}
