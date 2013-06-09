using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Online_Shop.Models;
using Online_Shop.ViewModels;

namespace Online_Shop.Controllers
{
    public class ShoppingCartController : Controller
    {
        OnlineShopEntities db = new OnlineShopEntities();
        //
        // GET: /ShoppingCart/

        public ActionResult Index()
        {
            var cart = ShoppingCart.GetCart(this.HttpContext);
            var viewModel = new ShoppingCartViewModel
            {
                CartItems = cart.GetCartItems(),
                CartTotal = cart.GetTotal()
            };

            return View(viewModel);
        }

        //
        // GET: /Store/AddToCart/5

        public ActionResult AddToCart(int id)
        {
            var addedBeanBag = db.BeanBags.Single(beanBag => beanBag.id == id);

            var cart = ShoppingCart.GetCart(this.HttpContext);

            cart.AddToCart(addedBeanBag);

            return RedirectToAction("Index");
        }

        //
        // AJAX: /ShoppingCart/RemoveFromCart/5

        [HttpPost]
        public ActionResult RemoveFromCart(int id)
        {
            var cart = ShoppingCart.GetCart(this.HttpContext);

            string beanBagName = db.Carts
                .Single(item => item.RecordId == id).BeanBag.name;

            int itemCount = cart.RemoveFromCart(id);

            var results = new ShoppingCartRemoveViewModel
            {
                Message = Server.HtmlEncode(beanBagName) +
                    " has been removed from your shopping cart.",
                CartTotal = cart.GetTotal(),
                CartCount = cart.GetCount(),
                ItemCount = itemCount,
                DeleteId = id
            };

            return Json(results);
        }

        //
        // GET: /ShoppingCart/CartSummary

        [ChildActionOnly]
        public ActionResult CartSummary()
        {
            var cart = ShoppingCart.GetCart(this.HttpContext);

            ViewData["CartCount"] = cart.GetCount();

            return PartialView("CartSummary");
        }
    }
}
