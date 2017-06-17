using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Net.Bndy.WebApp.Areas.Admin.Controllers
{
    using WebApp.Models;

    public class FileController : _ControllerBase
    {
        [HttpPost]
        public ActionResult Upload()
        {
            List<AppFile> result = new List<AppFile>();

            var relDir = string.Format("/upload/{0:yyyy-MM-dd}", DateTime.Now);
            var absDir = Server.MapPath(relDir);

            if (!Directory.Exists(absDir)) Directory.CreateDirectory(absDir);

            foreach (string fileTag in Request.Files)
            {
                var file = Request.Files[fileTag];
                var newFilename = string.Format("{0:N}{1}", Guid.NewGuid(),
                    file.FileName.Substring(file.FileName.LastIndexOf(".")));
                var relPath = string.Format("{0}/{1}", relDir, newFilename);
                var destFile = Server.MapPath(relPath);

                file.SaveAs(destFile);

                var appFile = Db.AppFiles.Add(new AppFile
                {
                    FileName = newFilename,
                    OriginalName = file.FileName,
                    Path = relPath,
                    UploadedAt = DateTime.Now,
                    Size = file.ContentLength,
                });
                Db.SaveChanges();

                result.Add(appFile);
            }

            return JsonNet(result, JsonRequestBehavior.DenyGet);
        }


        private class UploadResult
        {
            public string OriginalName { get; set; }
            public double Size { get; set; }
            public string NewName { get; set; }
            public string Path { get; set; }
        }
    }
}