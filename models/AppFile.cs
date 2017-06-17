using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Net.Bndy.WebApp.Models
{
    public class AppFile
    {
        [Key]
        public int Id { get; set; }
        public string FileName { get; set; }
        public string OriginalName { get; set; }
        public string Path { get; set; }
        public double Size { get; set; }
        public DateTime UploadedAt { get; set; }

    }
}
