using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;

namespace Net.Bndy.WebApp.Areas.Admin.Controllers
{
    using Net.Bndy.WebApp.Areas.Admin.Models;

    public class ApiController : _ControllerBase
    {
        public ActionResult GetMenus()
        {
            var lstMenu = new List<AppMenuViewModel>();
            lstMenu.Add(new AppMenuViewModel
            {
                Icon = "fa fa-dashboard fa-fw",
                Text = "Dashboard",
                Url = "/admin/home/index",
            });
            // level1
            for (var i = 1; i <= 10; i++)
            {
                var menuLevel1 = new AppMenuViewModel()
                {
                    Id = i.ToString(),
                    Text = "Level " + i,
                    Icon = "fa fa-fw fa-users text-aqua",
                };
                menuLevel1.Url = "#" + menuLevel1.Id;

                // level2
                if (i % 4 == 0)
                {
                    for (var x = 1; x <= 5; x++)
                    {
                        var menuLevel2 = new AppMenuViewModel()
                        {
                            Id = string.Format("{0} - {1}", i, x),
                            Text = "Level 2-" + x,
                            Icon = "fa fa-fw fa-users text-aqua",
                            Url = "#" + i,
                        };
                        menuLevel2.Url = "#" + menuLevel2.Id;

                        // level3
                        if (x % 2 == 0)
                        {
                            for (var y = 1; y <= 3; y++)
                            {
                                var menuLevel3 = new AppMenuViewModel()
                                {
                                    Id = string.Format("{0} - {1} - {2}", i, x, y),
                                    Text = "Level 3-" + y,
                                    Icon = "fa fa-fw fa-users text-aqua",
                                };
                                menuLevel3.Url = "#" + menuLevel3.Id;

                                menuLevel2.Children.Add(menuLevel3);
                            }
                        }

                        menuLevel1.Children.Add(menuLevel2);
                    }
                }
                else
                {
                    menuLevel1.Label = i.ToString();
                    menuLevel1.LabelClass = i % 2 == 0 ? "label-primary" : "label-default";
                }

                lstMenu.Add(menuLevel1);
            }

            return JsonNet(lstMenu, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetNotifications()
        {
            var lst = new List<AppNotificationViewModel>();
            for (var i = 1; i <= 10; i++)
            {
                lst.Add(new AppNotificationViewModel()
                {
                    Id = i.ToString(),
                    Title = i + " new members joined today",
                    Content = "New members joined today",
                    Icon = "fa "
                        + new string[] { "fa-users ", "fa-warning ", "fa-list " }[i % 3]
                        + new string[] { "text-success ", "text-warning", "text-danger " }[i % 3],
                    Type = i,
                });
            }
            return JsonNet(lst, JsonRequestBehavior.AllowGet);
        }
    }
}
