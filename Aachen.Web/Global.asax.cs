using System.Data.Entity;
using System.Diagnostics;
using System.Web;
using Aachen.Core.EF;
using Aachen.Infrastructure.Logging;
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
    public class MvcApplication : HttpApplication
    {
		private static readonly ILogger _logger = new Log4NetLogger();
 
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        protected void Application_Start()
        {
			log4net.Config.XmlConfigurator.Configure();
			_logger.Info("Adding new jokes...");

        	Application["LastJokesUpdate"] = DateTime.Now.AddDays(-1);
            AreaRegistration.RegisterAllAreas();

            RouteConfig.RegisterRoutes(RouteTable.Routes);
            RegisterGlobalFilters(GlobalFilters.Filters);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

		protected void Session_Start()
		{
			DateTime date;
			if (DateTime.TryParse(Application["LastJokesUpdate"].ToString(), out date))
			{
				if ((DateTime.Now - date).TotalHours > 1)
				{
					Session["LastJokesUpdate"] = DateTime.Now;
					var timer = new Timer {Interval = 5*60*1000, AutoReset = false};
					timer.Elapsed += OnTimerElapsed;
					timer.Start();
				}
			}
		}

        private static void OnTimerElapsed(object sender, ElapsedEventArgs e)
        {
            var failCount = 0;
            do
            {
                try
                {
                    _logger.Info("Adding new jokes...");
                    new JokesService(new EfUnitOfWork()).AddNewJokes();
                    _logger.Info("Success. New jokes added.");
                }
                catch (Exception ex)
                {
                    _logger.ErrorException("Failure. New jokes not added.", ex);
                    failCount++;
                }
            } while (failCount > 0 && failCount <= 3);
        }
    }
}