using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Online_Shop.Models;
using Online_Shop.Resources;

namespace Online_Shop.Controllers
{
    public class HomeController : Controller
    {
        private OnlineShopEntities db = new OnlineShopEntities();

        //start page and returns View from Views/Home/Index.cshtml
        public ActionResult Index()
        {
            return View(db.BeanBagTypes.ToList());
        }

        //returnd vire from Views/Home/About.cshtml
        public ActionResult About()
        {
            return View();
        }


    }
}
