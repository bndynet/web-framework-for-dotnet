using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace Net.Bndy.WebApp
{
    using Net.Bndy;

    public class WebApplication : System.Web.HttpApplication
    {
        public static Log.Logger Logger { private set; get; }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            Log.Logger.Init();
            Logger = Log.Logger.GetLogger(nameof(WebApplication), () =>
            {
                return new
                {
                    client_ip = HttpContext.Current.Request.UserHostAddress,
                    client_os = HttpContext.Current.Request.Browser.Platform,
                    browser = string.Format("{0} v{1}",
                        HttpContext.Current.Request.Browser.Browser,
                        HttpContext.Current.Request.Browser.Version
                        ),
                };
            });
        }
    }
}
