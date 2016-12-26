using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Net.Bndy.WebApp.Areas.Admin.Controllers
{
    using Net.Bndy.WebApp.Areas.Admin.Models;

    public class AccountController : _ControllerBase
    {
        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }

        [AllowAnonymous]
        public ActionResult Logout()
        {
            Session.Abandon();
            Session.Clear();
            return View("login");
        }

        [HttpPost]
        public ActionResult Login(LoginViewModel model)
        {
            // TODO: Implements
            // here to validate the user
            System.Threading.Thread.Sleep(2000);
            return JsonNet(model);
        }
    }
}