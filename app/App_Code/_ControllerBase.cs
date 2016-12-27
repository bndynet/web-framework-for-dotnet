using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Net.Bndy.WebApp
{
    public abstract class _ControllerBase : Net.Bndy.Web.MVC.ControllerBase
    {
        public ActionResult Error()
        {
            return View();
        }

        protected override void OnException(ExceptionContext filterContext)
        {
            WebApplication.Logger.Error("Controller Error", filterContext.Exception);

            filterContext.ExceptionHandled = true;
            if (Request.IsAjaxRequest())
            {
                filterContext.Result = AjaxError(filterContext.Exception);
            }
            else
            {
                TempData["Error"] = filterContext.Exception;
                filterContext.Result = RedirectToAction("Error");
            }

            base.OnException(filterContext);
        }

        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            WebApplication.Logger.InfoFormat("Request {0}", filterContext.RequestContext.HttpContext.Request.Url);

            base.OnActionExecuting(filterContext);
        }
    }
}