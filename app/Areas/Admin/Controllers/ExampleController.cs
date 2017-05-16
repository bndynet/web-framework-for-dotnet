using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Net.Bndy.Data;

namespace Net.Bndy.WebApp.Areas.Admin.Controllers
{
    public class ExampleController : _ControllerBase
    {
        public ActionResult Form()
        {
            return View();
        }

        public ActionResult Table()
        {
            return View();
        }

        public ActionResult Search(int page = 1, int pageSize = 10)
        {
            var result = new Page<object>(pageSize, page);

            result.RecordCount = 1023;

            for (var i = 1; i <= pageSize; i++)
            {
                result.Data.Add(new
                {
                    Title = "Title " + ((page - 1) * pageSize + i),
                    DateTime = DateTime.Now
                });
            }

            return JsonNet(result);
        }

        public ActionResult AngularMaterial()
        {
            return View();
        }
    }
}