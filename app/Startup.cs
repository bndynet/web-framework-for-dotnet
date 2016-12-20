using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Net.Bndy.WebApp.Startup))]
namespace Net.Bndy.WebApp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
        }
    }
}
