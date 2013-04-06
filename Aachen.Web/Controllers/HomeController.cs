using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Aachen.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Home(string pageNumber)
        {
            return View("Index");
        }
    }
}
