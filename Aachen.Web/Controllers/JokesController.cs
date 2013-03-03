using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Aachen.Core.EF;
using Aachen.Core.Interfaces;
using Aachen.Core.Interfaces.Services;
using Aachen.Infrastructure.Services;

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
            return View("Index");
        }

        public ActionResult GetRecent(int first, int count)
        {
            var jokes = _jokesService.GetRecent(first, count)
                .Select(x => new {
                                    Description = x.Description,
                                    Resource = x.Resource
                                 })
                .ToList();
            return Json(jokes, JsonRequestBehavior.AllowGet);
        }
    }
}
