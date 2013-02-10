using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Aachen.Core.EF;
using Aachen.Core.Interfaces;
using Aachen.Core.Interfaces.Services;
using Aachen.Infrastructure.Services;
using Aachen.Web.ViewModels;

namespace Aachen.Web.Controllers
{
    public class JokesController : Controller
    {
        private readonly IUnitOfWork _uow;
        private readonly IJokesService _jokesService;

        public JokesController()
        {
            _uow = new EfUnitOfWork();
            _jokesService = new JokesService(_uow);
        }

        public JokesController(IUnitOfWork uow, IJokesService jokesService)
        {
            _uow = uow;
            _jokesService = jokesService;
        }

        public ActionResult Jokes(string pageNumber)
        {
            int page;
            const int pageSize = 10;
            int jokeCount = _uow.Jokes.GetAll().Count();

            bool isValidPage = int.TryParse(pageNumber, out page) 
                                    && page > 0 
                                    && jokeCount > page * pageSize;
            int selectedPage = isValidPage ? page : 1;

            var jokes = _jokesService.GetJokesForPage(selectedPage, pageSize);
            var model = new JokesViewModel
                            {
                                Jokes = jokes.Select(x => new JokeViewModel
                                                        { 
                                                            Description = x.Description,
                                                            CreatedDate = x.CreatedDate,
                                                            WebResourceUrl = x.Resource.Name
                                                        })
                                         .ToList(),
                                PageCount = jokeCount % pageSize != 0 ? jokeCount / pageSize : jokeCount / pageSize + 1,
                                SelectedPage = selectedPage
                            };
            return View(model);

        }
    }
}
