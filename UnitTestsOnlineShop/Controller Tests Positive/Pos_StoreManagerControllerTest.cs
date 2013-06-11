using Online_Shop.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System.Web.Mvc;
using Online_Shop.Models;

namespace UnitTestsOnlineShop
{
    [TestClass()]
    public class Pos_StoreManagerControllerTest
    {
        BeanBag beanBagTest = new BeanBag();

        public int createTestData()
        {
            beanBagTest.name = "TestObject";
            beanBagTest.description = "";
            beanBagTest.price = 99;
            return beanBagTest.id;
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

        /*
        [TestMethod]
        public void Details()
        {
            int id = createTestData();
            
            // Arrange
            StoreManagerController controller = new StoreManagerController();

            // Act
            ViewResult result = controller.Details(id) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
         */

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

        /* Zuerst dummy objekt erzeugen und dessen id nehmen!
        [TestMethod]
        public void Edit()
        {
            int id = 15;
            // Arrange
            StoreManagerController controller = new StoreManagerController();

            // Act
            ViewResult result = controller.Edit(id) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
        *

        /* Zuerst dummy objekt erzeugen und dessen id nehmen!
        [TestMethod]
        public void Delete()
        {
            int id = 16;
            // Arrange
            StoreManagerController controller = new StoreManagerController();

            // Act
            ViewResult result = controller.Delete(id) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
         */

        /*
        [TestMethod]
        public void DeleteConfirmed()
        {
            int id = 15;
            // Arrange
            StoreManagerController controller = new StoreManagerController();

            // Act
            ViewResult result = controller.DeleteConfirmed(id) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
         */
    }
}
