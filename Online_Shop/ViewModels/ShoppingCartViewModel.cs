﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Online_Shop.Models;

namespace Online_Shop.ViewModels
{
    public class ShoppingCartViewModel
    {
        public List<Cart> CartItems { get; set; }
        public decimal CartTotal { get; set; }
    }
}