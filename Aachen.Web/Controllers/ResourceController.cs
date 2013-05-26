using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using Aachen.Core.EF;
using Aachen.Core.Interfaces;
using Aachen.Core.Interfaces.Services;
using Aachen.Infrastructure.Services;
using Aachen.Web.ViewModels;

namespace Aachen.Web.Controllers
{
    public class ResourceController : ApiController
    {
        private readonly IUnitOfWork _uow;
        private readonly IJokesService _jokesService;

        public ResourceController()
        {
            _uow = new EfUnitOfWork();
            _jokesService = new JokesService(_uow);
        }

        public ResourceController(IUnitOfWork uow, IJokesService jokesService)
        {
            _uow = uow;
            _jokesService = jokesService;
        }

        public JokeListViewModel GetNew(int first, int count)
        {
            var jokeList = _jokesService.GetRecent(first, count)
                .Select(x => new JokeViewModel
                    {
                        Id = x.Id,
                        Description = x.Description,
                        ResourceName = x.Resource.Name,
                        ResourceUrl = x.Resource.Url,
                        Rating = x.Rating,
                        CreatedDate = x.CreatedDate
                    })
                .ToList();

            return new JokeListViewModel
            {
                JokeList = jokeList,
                First = first
            };
        }

        public JokeListViewModel GetTopRated(int first, int count)
        {
            var jokeList = _jokesService.GetTopRated(first, count)
                .Select(x => new JokeViewModel
                {
                    Id = x.Id,
                    Description = x.Description,
                    ResourceName = x.Resource.Name,
                    ResourceUrl = x.Resource.Url,
                    Rating = x.Rating
                })
                .ToList();
            return new JokeListViewModel
            {
                JokeList = jokeList,
                First = first
            };
        }

        public void PostRating(long jokeId, int value)
        {
            if (value > 0)
                _jokesService.IncrementRating(jokeId);
            else if (value < 0)
                _jokesService.DecrementRating(jokeId);
        }
    }
}
