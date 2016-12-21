using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Net.Bndy.WebApp.Areas.Admin.Models
{
    public class AppNotificationViewModel
    {
        public string Id { get; set; }
        public string Icon { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public int Type { get; set; }
    }
}