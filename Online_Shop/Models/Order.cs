using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace Online_Shop.Models
{
    [Bind(Exclude = "OrderId")]
    public class Order
    {
        [ScaffoldColumn(false)]
        public int OrderId { get; set; }

        [ScaffoldColumn(false)]
        public string Username { get; set; }

        [Required(ErrorMessage = "First Name is required")]
        [DisplayName("First Name")]
        [RegularExpression(@"[A-Za-z]",
        ErrorMessage = "First Name is is not valid.")]
        [StringLength(40)]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Last Name is required")]
        [DisplayName("Last Name")]
        [RegularExpression(@"[A-Za-z]",
        ErrorMessage = "Last Name is is not valid.")]
        [StringLength(40)]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Street is required")]
        [DisplayName("Street")]
        [RegularExpression(@"[A-Za-z]",
        ErrorMessage = "Street is is not valid.")]
        [StringLength(70)]
        public string street { get; set; }

        [Required(ErrorMessage = "Hno is required")]
        [DisplayName("Hno")]
        [RegularExpression(@"[A-Za-z]",
        ErrorMessage = "Hno is is not valid.")]
        [StringLength(5)]
        public string hno { get; set; }

        [Required(ErrorMessage = "Zip Code is required")]
        [DisplayName("Zip Code")]
        [RegularExpression(@"[0-9]",
        ErrorMessage = "Hno is is not valid.")]
        [StringLength(4)]
        public string Zip { get; set; }

        [Required(ErrorMessage = "City is required")]
        [DisplayName("City")]
        [RegularExpression(@"[A-Za-z]",
        ErrorMessage = "City is is not valid.")]
        [StringLength(40)]
        public string City { get; set; }

        [Required(ErrorMessage = "Phone is required")]
        [DisplayName("Phone (e.g. +41 123 45 67")]
        [StringLength(12)]
        public string Phone { get; set; }

        [Required(ErrorMessage = "Email Address is required")]
        [DisplayName("Email Address")]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}",
        ErrorMessage = "Email is is not valid.")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [ScaffoldColumn(false)]
        public decimal Total { get; set; }

        [ScaffoldColumn(false)]
        public System.DateTime OrderDate { get; set; }

        public List<OrderDetail> OrderDetails { get; set; }
    }
}