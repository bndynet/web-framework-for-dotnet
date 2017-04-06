using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Net.Bndy.WebApp.Controllers
{
    using Models;

    public class HomeController : _ControllerBase
    {
        public ActionResult Index()
        {
            var model = new HomeIndexViewModel();

            var imageFiles = Directory.GetFiles(Server.MapPath("~/images"), "banner_*");
            foreach(var image in imageFiles)
            {
                model.Banners.Add(new Banner {
                    Image = image.Replace(Server.MapPath("~/"), "").Replace("\\", "/")
                });
            }

            return View(model);
        }
    }
}