using System;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;

namespace Aachen.Web.App_Start
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "",
                defaults: new { controller = "Home", action = "Home" }
            );

            routes.MapHttpRoute(
              name: "DefaultApi",
              routeTemplate: "api/{controller}/{id1}/{id2}",
              defaults: new { id1 = RouteParameter.Optional, id2 = RouteParameter.Optional }
            );
        }
    }
}