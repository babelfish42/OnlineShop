using Online_Shop.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System.Web.Mvc;
using Online_Shop.Models;

namespace UnitTestsOnlineShop
{
    [TestClass()]
    public class Pos_BeanBagsControllerTest
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
            BeanBagsController controller = new BeanBagsController();

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
            BeanBagsController controller = new BeanBagsController();

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
            BeanBagsController controller = new BeanBagsController();

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
            BeanBagsController controller = new BeanBagsController();

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
            BeanBagsController controller = new BeanBagsController();

            // Act
            ViewResult result = controller.Delete(beanBag.id) as ViewResult;

            // Assert
            Assert.IsNotNull(result);

            deleteTestObject(beanBag.id);
        }

        /*
        [TestMethod]
        public void DeleteConfirmed()
        {
            createTestObject();
            deleteTestObject(beanBag.id);
            // Arrange
            BeanBagsController controller = new BeanBagsController();

            // Act
            ViewResult result = controller.DeleteConfirmed(beanBag.id) as ViewResult;

            // Assert
            Assert.IsNull(result);
            
        }*/
         

        [TestMethod]
        public void Browse()
        {
            string beanBagType = "Device";

            // Arrange
            BeanBagsController controller = new BeanBagsController();

            // Act
            ViewResult result = controller.Browse(beanBagType) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void BeanBagTypesMenu()
        {
            // Arrange
            BeanBagsController controller = new BeanBagsController();

            // Act
            PartialViewResult result = controller.BeanBagTypesMenu() as PartialViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
    }
}


