using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Net.Bndy.WebApp.Areas.Admin.Controllers
{
    public class HomeController : _ControllerBase
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Dashboard()
        {
            return View();
        }

        public ActionResult Search(string q)
        {
            ViewBag.Keywords = q;
            // TODO: implement this method
            return View();
        }
    }
}