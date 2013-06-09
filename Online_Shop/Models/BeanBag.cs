using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Online_Shop.Models
{
    public class BeanBag
    {
        public int id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public int price { get; set; }
        public string color { get; set; }
        public string measure { get; set; }
        public string picture { get; set; }
        public int beanBagTypeID { get; set; }
        public virtual BeanBagType BeanBagType { get; set; }
    }
}