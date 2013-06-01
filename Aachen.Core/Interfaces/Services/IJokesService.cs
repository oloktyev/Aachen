using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Aachen.Core.Model;
using Aachen.Core.DTO;

namespace Aachen.Core.Interfaces.Services
{
    public interface IJokesService
    {
        Joke GetLast(int resourceId);

        IQueryable<Joke> GetJokesForPage(int pageNumber, int pageSize);

        IQueryable<Joke> GetRecent(int first, int count);

        IQueryable<Joke> GetTopRated(int first, int count);

        IQueryable<Joke> GetFeatured(IList<long> jokes);

        IList<CategoriesDTO> GetCategories();

        IList<Joke> GetByCategory(byte id, int first, int count);

        IList<Joke> AddNewJokes();

        IList<Joke> FixExistingJokes();

        IList<Joke> RecalculateCategories();

        void IncrementRating(long jokeId);

        void DecrementRating(long jokeId);
    }
}
