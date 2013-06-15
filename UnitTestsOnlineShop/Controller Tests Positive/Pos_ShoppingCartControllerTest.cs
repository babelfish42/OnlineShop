using Online_Shop.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System.Web.Mvc;
using Online_Shop.Models;
using System.Collections.Generic;
using System.Transactions;
using Online_Shop.ViewModels;
using System.Linq;
using System.Web;

namespace UnitTestsOnlineShop
{
    [TestClass()]
    public class Pos_ShoppingCartControllerTest
    {
        private OnlineShopEntities db = new OnlineShopEntities();

        BeanBag beanBag = null;
        Order order = null;


        public int createTestObject()
        {
            beanBag = new BeanBag { name = "testObject", beanBagTypeID = 1 };
            order = new Order
            {
                Username = "TestUsername",
                FirstName = "TestFirstName",
                LastName = "TestLastName",
                street = "TestStreet",
                hno = "TestHno",
                Zip = "TestZip",
                City = "TestCity",
                Phone = "TestPhone",
                Email = "email@test.com",
                Total = 100,
                OrderDate = DateTime.Now
            };

            db.BeanBags.Add(beanBag);
            db.Orders.Add(order);
            //db.Carts.Add(cart);
            db.SaveChanges();

            return beanBag.id;
        }

        public void deleteTestObject(int id)
        {
            BeanBag beanbag = db.BeanBags.Find(id);
            db.BeanBags.Remove(beanbag);

            Order order = db.Orders.Find(id);
            db.Orders.Remove(order);

            Cart cart = db.Carts.Find(id);
            db.Carts.Remove(cart);

            db.SaveChanges();
        }
        /*
        [TestMethod]
        public void Index()
        {
            createTestObject();
            
            // Arrange
            ShoppingCartController controller = new ShoppingCartController();

            // Act
            ViewResult result = controller.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
            
            deleteTestObject(beanBag.id);
        }*/


        /*
        [TestMethod]
        public void AddToCart()
        {}
         => automatically tested within Index() function
         */


        /*
        [TestMethod]
        public void RemoveFromCart()
        {
            int id = 1;
            // Arrange
            ShoppingCartController controller = new ShoppingCartController();

            // Act
            ViewResult result = controller.RemoveFromCart(id) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
        */

        /*
        [TestMethod]
        public void CartSummary()
        {
            
            // Arrange
            ShoppingCartController controller = new ShoppingCartController();

            // Act
            ViewResult result = controller.CartSummary() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
        */
    }
}
