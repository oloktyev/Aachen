﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace Aachen.Web.App_Start
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.IgnoreList.Clear();

            bundles.Add(new StyleBundle("~/content/css").Include(
                        "~/Content/css/bootstrap.css",
                        "~/Content/css/aachen.css"));

            bundles.Add(new ScriptBundle("~/content/js").Include(
                        "~/Scripts/Libs/Jquery/jquery-1.9.1.js",
                        "~/Scripts/Libs/Jquery/jquery.masonry.min.js",
                        "~/Scripts/Libs/Angular/angular.js",
                        "~/Scripts/Libs/Angular/angular-resource.js",
                        "~/Scripts/Libs/Angular/angular-sanitize.js",
                        "~/Content/js/app.js",
                        "~/Content/js/directives.js",
                        "~/Content/js/controllers.js"));

        }
    }
}