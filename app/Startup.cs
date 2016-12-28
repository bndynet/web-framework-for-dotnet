using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Net.Bndy.WebApp.Startup))]
namespace Net.Bndy.WebApp
{
    using Net.Bndy.Web;
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            AspNetAuthentication.Enable(app, "/admin/account/login");
        }
    }
}
