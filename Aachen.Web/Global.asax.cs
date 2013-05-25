using System.Data.Entity;
using System.Diagnostics;
using System.Web;
using Aachen.Core.EF;
using Aachen.Infrastructure.Services;
using Aachen.Web.App_Start;
using System;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Timers;

namespace Aachen.Web
{
    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RouteConfig.RegisterRoutes(RouteTable.Routes);
            RegisterGlobalFilters(GlobalFilters.Filters);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            
            var timer = new Timer {Interval = 60*60*1000, AutoReset = true };
            timer.Elapsed += OnTimerElapsed;
            timer.Start();

        }

        private static void OnTimerElapsed(object sender, ElapsedEventArgs e)
        {
            var failCount = 0;
            do
            {

                try
                {
                    new JokesService(new EfUnitOfWork()).AddNewJokes();
                }
                catch (Exception)
                {
                    failCount++;
                }
            } while (failCount > 0 && failCount <= 3);
        }
    }
}