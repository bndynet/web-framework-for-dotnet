using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Net.Bndy.WebApp.Models
{
    public class AppDbContext : IdentityDbContext
    {
        public AppDbContext()
        {
            this.Database.CreateIfNotExists();
        }

        public DbSet<AppUser> AppUsers { get; set; }
        public DbSet<AppRole> AppRoles { get; set; }
        public DbSet<AppFile> AppFiles { get; set; }
    }
}
