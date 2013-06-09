using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Online_Shop.Models;

namespace Online_Shop.Controllers
{

    public class BeanBagsController : Controller
    {
        private OnlineShopEntities db = new OnlineShopEntities();

        //
        // GET: /BeanBags/
        public ActionResult Index()
        {
            return View(db.BeanBags.ToList());
        }

        //
        // GET: /BeanBags/Details/5
        public ActionResult Details(int id = 0)
        {
            BeanBag beanbag = db.BeanBags.Find(id);
            if (beanbag == null)
            {
                return HttpNotFound();
            }
            return View(beanbag);
        }

        //
        // GET: /BeanBags/Create
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /BeanBags/Create
        [HttpPost]
        public ActionResult Create(BeanBag beanbag)
        {
            if (ModelState.IsValid)
            {
                db.BeanBags.Add(beanbag);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(beanbag);
        }

        //
        // GET: /BeanBags/Edit/5
        public ActionResult Edit(int id = 0)
        {
            BeanBag beanbag = db.BeanBags.Find(id);
            if (beanbag == null)
            {
                return HttpNotFound();
            }
            return View(beanbag);
        }

        //
        // POST: /BeanBags/Edit/5
        [HttpPost]
        public ActionResult Edit(BeanBag beanbag)
        {
            if (ModelState.IsValid)
            {
                db.Entry(beanbag).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(beanbag);
        }

        //
        // GET: /BeanBags/Delete/5
        public ActionResult Delete(int id = 0)
        {
            BeanBag beanbag = db.BeanBags.Find(id);
            if (beanbag == null)
            {
                return HttpNotFound();
            }
            return View(beanbag);
        }

        //
        // POST: /BeanBags/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            BeanBag beanbag = db.BeanBags.Find(id);
            db.BeanBags.Remove(beanbag);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

       //
        // GET: /BeanBags/Browse?beanBagType=Person

        public ActionResult Browse(string beanBagType)
        {
            var beanBagTypeModel = db.BeanBagTypes.Include("BeanBag").Single(g => g.name == beanBagType);

            return View(beanBagTypeModel);
        }

        //
        // GET: /BeanBags/BeanBagTypeMenu

        [ChildActionOnly]
        public ActionResult BeanBagTypesMenu()
        {
            var beanBagTypes = db.BeanBagTypes.ToList();

            return PartialView(beanBagTypes);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}