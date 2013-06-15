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
    public class Pos_StoreManagerControllerTest 
    {
        private OnlineShopEntities db = new OnlineShopEntities();

        BeanBag beanBag = null;

        public int createTestObject()
        {
            beanBag = new BeanBag { name = "testObject", beanBagTypeID = 1 };
            db.BeanBags.Add(beanBag);
            db.SaveChanges();

            return beanBag.id;
        }

        public void deleteTestObject(int id)
        {
            BeanBag beanbag = db.BeanBags.Find(id);
            db.BeanBags.Remove(beanbag);
            db.SaveChanges();
        }

        [TestMethod]
        public void Index()
        {
            // Arrange
            StoreManagerController controller = new StoreManagerController();

            // Act
            ViewResult result = controller.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void Details()
        {
            createTestObject();

            // Arrange
            StoreManagerController controller = new StoreManagerController();

            // Act
            ViewResult result = controller.Details(beanBag.id) as ViewResult;
            
            // Assert
            Assert.IsNotNull(result);

            deleteTestObject(beanBag.id);
        }
         

        [TestMethod]
        public void Create()
        {
            // Arrange
            StoreManagerController controller = new StoreManagerController();

            // Act
            ViewResult result = controller.Create() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

       
        [TestMethod]
        public void Edit()
        {
            createTestObject();

            // Arrange
            StoreManagerController controller = new StoreManagerController();

            // Act
            ViewResult result = controller.Edit(beanBag.id) as ViewResult;

            // Assert
            Assert.IsNotNull(result);

            deleteTestObject(beanBag.id);
        }
        

        
        [TestMethod]
        public void Delete()
        {
            createTestObject();

            // Arrange
            StoreManagerController controller = new StoreManagerController();

            // Act
            ViewResult result = controller.Delete(beanBag.id) as ViewResult;

            // Assert
            Assert.IsNotNull(result);

            deleteTestObject(beanBag.id);
        }
         

        /*
        [TestMethod]
        public void DeleteConfirmed()
        {...}
         => automatically tested within Delete function
         */
    }
}
