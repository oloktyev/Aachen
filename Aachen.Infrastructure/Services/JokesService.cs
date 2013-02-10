using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Aachen.Core.Base;
using Aachen.Core.Interfaces;
using Aachen.Core.Interfaces.Services;
using Aachen.Core.Model;
using Aachen.Infrastructure.Parsers;

namespace Aachen.Infrastructure.Services
{
    public class JokesService : IJokesService
    {
        private readonly IUnitOfWork _uow;

        public JokesService(IUnitOfWork uow)
        {
            _uow = uow;
        }

        public Joke GetLast(int resourceId)
        {
            return _uow.Jokes.GetAll()
                    .Where(e => e.Resource.Id == resourceId)
                    .OrderByDescending(x => x.CreatedDate)
                    .FirstOrDefault();
        }

        public IQueryable<Joke> GetJokesForPage(int pageNumber, int pageSize)
        {
            if (pageNumber <= 0 || pageSize <= 0)
                return Enumerable.Empty<Joke>().AsQueryable();

            return _uow.Jokes.GetAll()
                .OrderByDescending(x => x.CreatedDate)
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize);
        }

        public IList<Joke> AddNewJokes()
        {
            var newJokes = new List<Joke>();
            var webResources = _uow.Resources.GetAll().ToList();
            if (webResources[0].Type == null)
                Console.WriteLine();
            Parallel.ForEach(webResources, webResource =>
            {
                if (webResource.Type == null)
                    Console.WriteLine();
                var result = ParseResourse(webResource);
                if (result != null)
                    newJokes.AddRange(result);
            });
            if (newJokes.Count > 0)
            {
                _uow.Jokes.AddMany(newJokes);
                
            }
            return newJokes;
        }

        #region Private Methods

        private IEnumerable<Joke> ParseResourse(Resource webResource)
        {

            var parser = GetParser((Enums.ResourceType)webResource.Type.Id);
            var result = parser.Parse(webResource.Url);
            var jokes =
                result.Select(j => new Joke {Description = j, Resource = webResource, CreatedDate = DateTime.Now})
                        .ToList();
            return HasNewJokes(jokes) ? jokes : null;
        }

        private bool HasNewJokes(List<Joke> jokes)
        {
            if (jokes.Count == 0)
                return false;
            var lastJoke = _uow.Jokes.GetAll().ToList()
                                        .Where(x => x.Resource.Id == jokes[0].Resource.Id)
                                        .OrderByDescending(x => x.CreatedDate)
                                        .FirstOrDefault();
            return lastJoke == null || !jokes.Select(x => x.Description).Contains(lastJoke.Description);
        }

        private FeedParserBase GetParser(Enums.ResourceType webResourceType)
        {
            switch (webResourceType)
            {
                case Enums.ResourceType.RSS:
                    return new RssParser();
                default:
                    throw new NotImplementedException();
            }
        }

        #endregion
    }
}
