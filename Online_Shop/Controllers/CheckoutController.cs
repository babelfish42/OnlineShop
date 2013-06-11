using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Online_Shop.Models;

namespace Online_Shop.Controllers
{
    [Authorize]
    public class CheckoutController : Controller
    {
        OnlineShopEntities db = new OnlineShopEntities();

        //
        // GET: /Checkout/AddressAndPayment

        public ActionResult AddressAndPayment()
        {
            return View();
        }

        //
        // POST: /Checkout/AddressAndPayment

        [HttpPost]
        public ActionResult AddressAndPayment(FormCollection values, string Subject, string Body)
        {
            var order = new Order();
            TryUpdateModel(order);

            try
            {
                    order.Username = User.Identity.Name;
                    order.OrderDate = DateTime.Now;

                    //Save Order
                    db.Orders.Add(order);
                    db.SaveChanges();

                    //Process the order
                    var cart = ShoppingCart.GetCart(this.HttpContext);
                    cart.CreateOrder(order);

                    Subject = "Order from user"+order.Username;
                    Body = order.LastName;

                    return RedirectToAction("Complete",new { id = order.OrderId });

            }
            catch
            {
                //Invalid - redisplay with errors
                return View(order);
            }
        }

        //
        // GET: /Checkout/Complete

        public ActionResult Complete(int id)
        {
            // Validate customer owns this order
            bool isValid = db.Orders.Any(
                o => o.OrderId == id &&
                o.Username == User.Identity.Name);
            

            if (isValid)
            {
                IQueryable<string> queryMailAddress = (from Order in db.Orders where (Order.OrderId == id) select Order.Email);

                IQueryable<string> queryBeanBagName = (from BeanBag b in db.BeanBags join OrderDetail o in db.OrderDetails on b.id equals o.BeanBagId where (o.OrderId == id) select b.name);

                string beanBagName = queryBeanBagName.First();
                string eMailAdress = queryMailAddress.First();
                
                SendMail("Your Order from babelfish42 Online Store", beanBagName, eMailAdress);
                return View(id);
            }
            else
            {
                return View("Error");
            }
        }

        public void SendMail(string Subject, string Body, string eMailAddress)
        {
            EMail oMail = new EMail();
            oMail.SendMail("Email", eMailAddress, new String[] { Subject, Body });

        }

        
    }
}
