using System.Web;
using System.Web.Optimization;

namespace Net.Bndy.WebApp
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/js").Include(
                        "~/plugins/jQuery/jquery-2.2.3.min.js",
                        "~/plugins/bootstrap/js/bootstrap.min.js",
                        "~/plugins/bootstrap-more/dist/bootstrap-more.js"
                        ));

            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));


            bundles.Add(new StyleBundle("~/bundles/1").Include(
                "~/Content/style.css"));
            bundles.Add(new StyleBundle("~/bundles/1/2").Include(
                ));
            bundles.Add(new StyleBundle("~/bundles/1/2/3").Include(
                "~/plugins/bootstrap/css/bootstrap.css",
                "~/plugins/bootstrap-more/dist/bootstrap-more.css"
                ));
        }
    }
}
