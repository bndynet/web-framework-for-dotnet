using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Net.Bndy.WebApp.Models
{
    public class HomeIndexViewModel
    {
        public List<Banner> Banners { get; set; }

        public HomeIndexViewModel()
        {
            this.Banners = new List<Banner>();
        }
    }

    public class Banner
    {
        public string Image { get; set; }
        public string Caption { get; set; }
    }
}