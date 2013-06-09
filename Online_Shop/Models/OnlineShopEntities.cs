using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace Online_Shop.Models
{
    public class OnlineShopEntities : DbContext
    {
        public DbSet<BeanBag> BeanBags { get; set; }
        public DbSet<BeanBagType> BeanBagTypes { get; set; }
        public DbSet<Cart> Carts { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
    }
}