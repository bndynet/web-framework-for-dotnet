using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Net.Bndy.WebApp.Models
{
    public class AppMenuViewModel
    {
        public string Id { get; set; }
        public string Url { get; set; }
        public string Text { get; set; }
        public string Icon { get; set; }
        public int DisplayOrder { get; set; }
        public string Label { get; set; }
        public string LabelClass { get; set; }
        public List<AppMenuViewModel> Children { get; set; }

        public AppMenuViewModel()
        {
            this.Children = new List<AppMenuViewModel>();
        }
    }
}