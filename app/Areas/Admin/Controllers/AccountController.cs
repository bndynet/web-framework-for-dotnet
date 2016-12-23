using Net.Bndy.WebApp.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Net.Bndy.WebApp.Areas.Admin.Controllers
{
    public class AccountController : _ControllerBase
    {
        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginViewModel model)
        {
            return JsonNet(model);
        }
    }
}