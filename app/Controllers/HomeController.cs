using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Net.Bndy.WebApp.Controllers
{
    using Net.Bndy.WebApp;

    public class HomeController : _ControllerBase
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}