using Online_Shop.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System.Web.Mvc;

namespace UnitTestsOnlineShop
{
    [TestClass()]
    public class Pos_CheckoutControllerTest
    {
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

        /*Dummy Objekt erzeugen und dessen ID nehmen!!*/
        /*
        [TestMethod]
        public void Complete()
        {
            int id = 15;
            // Arrange
            CheckoutController controller = new CheckoutController();

            // Act
            ViewResult result = controller.Complete(id) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
         */
    }
}
