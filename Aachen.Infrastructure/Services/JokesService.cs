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
using Aachen.Core.DTO;
using Aachen.Infrastructure.ResourceProcessingRules;

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

        public IQueryable<Joke> GetRecent(int first, int count)
        {
            if (first < 0 || count <= 0)
                return Enumerable.Empty<Joke>().AsQueryable();

            return _uow.Jokes.GetAll()
                .OrderByDescending(x => x.Id)
                .Skip(first)
                .Take(count);
        }

        public IQueryable<Joke> GetTopRated(int first, int count)
        {
            if (first < 0 || count <= 0)
                return Enumerable.Empty<Joke>().AsQueryable();

            return _uow.Jokes.GetAll()
                .OrderByDescending(x => x.Rating)
                .Skip(first)
                .Take(count);
        }

        public IQueryable<Joke> GetFeatured(IList<long> jokes)
        {
            return _uow.Jokes.GetAll()
                       .Where(x => jokes.Contains(x.Id));
        }

        public IList<Joke> AddNewJokes()
        {
            var newJokes = new List<Joke>();
            var allResources = _uow.Resources.GetAll().ToList();
            var webResources = allResources.Select(x => new 
                {
                    TypeId = x.Type.Id,
                    ResourseId = x.Id, 
                    x.Url,
                    x.Rules
                });

            var lastJokes = _uow.Jokes.GetLatestJokes();
            Parallel.ForEach(webResources, webResourse =>
                {
                    var lastJoke = lastJokes.FirstOrDefault(x => x.ResourceId == webResourse.ResourseId);
                    var result = ParserHelper
                        .ParseResourse(webResourse.TypeId, webResourse.Url)
                        .ApplyRules(webResourse.Rules.Where(x => x.Active).ToList())
                        .RemoveOldJokes(lastJoke == null ? null : lastJoke.Description)
                        .CreateJokes(allResources.First(x => x.Id == webResourse.ResourseId));
                    newJokes.AddRange(result);
            });

            if (newJokes.Count > 0)
            {
                _uow.Jokes.AddMany(newJokes.OrderBy(x => x.Description[3]).ToList());
                _uow.CommitChanges();
            }
            return newJokes;
        }

        public IList<Joke> FixExistingJokes()
        {
            var jokes = _uow.Jokes.GetAll().ToList();
            var rules = _uow.ResourceProcessingRule.GetAll().Where(x => x.Active).ToList();

            foreach (var joke in jokes)
            {
                var currentJoke = joke;
                foreach (var rule in rules.Where(r => r.Resource.Id == currentJoke.Resource.Id))
                    currentJoke.Description = RuleCreator.GetRule(rule.Rule)
                                                  .Apply(currentJoke.Description, rule.Argument);
                
                if(string.IsNullOrEmpty(currentJoke.Description))
                     _uow.Jokes.Delete(currentJoke);
                else 
                    _uow.Jokes.Update(currentJoke);
            }

            _uow.CommitChanges();
            return jokes;
        }

        public void IncrementRating(long jokeId)
        {
            var joke = _uow.Jokes.Get(jokeId);
            joke.Rating++;
            _uow.CommitChanges();
        }

        public void DecrementRating(long jokeId)
        {
            var joke = _uow.Jokes.Get(jokeId);
            joke.Rating--;
            _uow.CommitChanges();
        }

        #region Private Methods

        private string GetLastJoke(int resourceId)
        {
            var lastJoke = _uow.Jokes.GetAll()
                                .Where(x => x.Resource.Id == resourceId)
                                .OrderByDescending(x => x.CreatedDate)
                                .FirstOrDefault();
            return lastJoke == null ? null : lastJoke.Description;
        }
        
        #endregion
    }
}
