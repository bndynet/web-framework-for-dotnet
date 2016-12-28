using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Net.Bndy.WebApp.Areas.Admin.Controllers
{
    using Net.Bndy.Web;
    using Net.Bndy.WebApp.Areas.Admin.Models;

    public class AccountController : _ControllerBase
    {
        [HttpGet]
        [AllowAnonymous]
        public ActionResult Register()
        {
            if (Auth.GetUsers().Count() > 0)
            {
                return RedirectToAction("Login");
            }
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        public ActionResult Register(string username, string password)
        {
            if (Auth.GetUsers().Count() > 0)
            {
                return RedirectToAction("login");
            }

            Auth.CreateUser(new Microsoft.AspNet.Identity.EntityFramework.IdentityUser
            {
                UserName = username,
            }, password);
            return Content("OK");
        }

        [AllowAnonymous]
        public ActionResult Login()
        {
            if (Auth.GetUsers().Count() == 0)
            {
                return RedirectToAction("register");
            }
            return View();
        }

        [AllowAnonymous]
        public ActionResult Logout()
        {
            Auth.SignOut();
            return View("login");
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Login(LoginViewModel model)
        {
            System.Threading.Thread.Sleep(2000);
            var identity = Auth.SignIn(model.UserName, model.Password);
            if (identity != null)
            {
                return AjaxOK();
            }
            else
            {
                return AjaxError();
            }
        }
    }
}