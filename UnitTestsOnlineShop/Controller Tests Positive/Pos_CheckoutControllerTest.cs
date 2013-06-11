using Online_Shop.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System.Web.Mvc;
using Online_Shop.Models;
using System.Collections.Generic;


namespace UnitTestsOnlineShop
{
    [TestClass()]
    public class Pos_CheckoutControllerTest
    {
        private OnlineShopEntities db = new OnlineShopEntities();

        BeanBag beanBag = null;
        Order order = null;
         
        public int createTestObject()
        {
            beanBag = new BeanBag { name = "testObject", beanBagTypeID = 1 };
            order = new Order { Username = "TestUsername", FirstName = "TestFirstName", LastName = "TestLastName", street = "TestStreet", 
                hno = "TestHno", Zip = "TestZip", City = "TestCity", Phone = "TestPhone", Email = "email@test.com", Total = 100, OrderDate = DateTime.Now };
            
            db.BeanBags.Add(beanBag);
            db.Orders.Add(order);
            db.SaveChanges();

            return beanBag.id;
        }

        public void deleteTestObject(int id)
        {
            BeanBag beanbag = db.BeanBags.Find(id);
            db.BeanBags.Remove(beanbag);

            Order order = db.Orders.Find(id);
            db.Orders.Remove(order);

            db.SaveChanges();
        }

        [TestMethod]
        public void AddressAndPayment()
        {
            // Arrange
            CheckoutController controller = new CheckoutController();

            // Act
            ViewResult result = controller.AddressAndPayment() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        
        /*
        [TestMethod]
        public void Complete()
        {
            createTestObject();

            // Arrange
            CheckoutController controller = new CheckoutController();

            // Act
            ViewResult result = controller.Complete(beanBag.id) as ViewResult;

            // Assert
            Assert.IsNotNull(result);

            deleteTestObject(beanBag.id);
        }
         */
    }
}
