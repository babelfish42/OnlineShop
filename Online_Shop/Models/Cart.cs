using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Online_Shop.Models
{
    public class Cart
    {
        [Key]
        public int RecordId { get; set; }
        public int BeanBagId { get; set; }
        public string CartId { get; set; }
        //public int BeanBagTypeId { get; set; }
        public int Count { get; set; }
        public System.DateTime DateCreated { get; set; }
        public virtual BeanBag BeanBag { get; set; }
    }
}