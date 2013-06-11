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

        /*Dummy Objekt erzeugen und dessen ID nehmen!!*/
        [TestMethod]
        public void Details()
        {
            int id = 15;
            // Arrange
            BeanBagsController controller = new BeanBagsController();

            // Act
            ViewResult result = controller.Details(id) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
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

        /*Dummy Objekt erzeugen und dessen ID nehmen!!*/
        [TestMethod]
        public void Edit()
        {
            int id = 15;

            // Arrange
            BeanBagsController controller = new BeanBagsController();

            // Act
            ViewResult result = controller.Edit(id) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        /*Dummy Objekt erzeugen und dessen ID nehmen!!*/
        [TestMethod]
        public void Delete()
        {
            int id = 15;

            // Arrange
            BeanBagsController controller = new BeanBagsController();

            // Act
            ViewResult result = controller.Delete(id) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        /*
        [TestMethod]
        public void DeleteConfirmed()
        {
            int id = 1;

            // Arrange
            BeanBagsController controller = new BeanBagsController();

            // Act
            ViewResult result = controller.DeleteConfirmed(id) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
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


