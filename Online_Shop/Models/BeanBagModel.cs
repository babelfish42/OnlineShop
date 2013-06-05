using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace Online_Shop.Models
{
    public class BeanBagModel
    {
        public int id { get; set; }
        public string name { get; set; }
    }
    public class BeanBagDBContext : DbContext
    {
        public DbSet<BeanBagPerson> BeanBagPersons { get; set; }
        public DbSet<BeanBagModel> BeanBagModels { get; set; }

        public DbSet<BeanBagDevice> BeanBagDevices { get; set; }
    }
}