﻿using System;
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

        public IList<JokeViewModel> GetNew(int first, int count)
        {
            var result = _jokesService.GetRecent(first, count)
                .Select(x => new JokeViewModel
                    {
                        Description = x.Description,
                        ResourceName = x.Resource.Name,
                        ResourceUrl = x.Resource.Url
                    })
                .ToList();
            return result;
        }
    }
}