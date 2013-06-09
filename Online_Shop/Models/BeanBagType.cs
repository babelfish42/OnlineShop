using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Online_Shop.Models
{
    public class BeanBagType
    {
        public int id { get; set; }
        public string name {get; set;}
        public List<BeanBag> BeanBag { get; set; }
    }
}