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
    public class StoreManagerController : Controller
    {
        private OnlineShopEntities db = new OnlineShopEntities();

        //
        // GET: /StoreManager/

        public ActionResult Index()
        {
            var beanbags = db.BeanBags.Include(b => b.BeanBagType);
            return View(beanbags.ToList());
        }

        //
        // GET: /StoreManager/Details/5

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
        // GET: /StoreManager/Create

        public ActionResult Create()
        {
            ViewBag.beanBagTypeID = new SelectList(db.BeanBagTypes, "id", "name");
            return View();
        }

        //
        // POST: /StoreManager/Create

        [HttpPost]
        public ActionResult Create(BeanBag beanbag)
        {
            if (ModelState.IsValid)
            {
                db.BeanBags.Add(beanbag);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.beanBagTypeID = new SelectList(db.BeanBagTypes, "id", "name", beanbag.beanBagTypeID);
            return View(beanbag);
        }

        //
        // GET: /StoreManager/Edit/5

        public ActionResult Edit(int id = 0)
        {
            BeanBag beanbag = db.BeanBags.Find(id);
            if (beanbag == null)
            {
                return HttpNotFound();
            }
            ViewBag.beanBagTypeID = new SelectList(db.BeanBagTypes, "id", "name", beanbag.beanBagTypeID);
            return View(beanbag);
        }

        //
        // POST: /StoreManager/Edit/5

        [HttpPost]
        public ActionResult Edit(BeanBag beanbag)
        {
            if (ModelState.IsValid)
            {
                db.Entry(beanbag).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.beanBagTypeID = new SelectList(db.BeanBagTypes, "id", "name", beanbag.beanBagTypeID);
            return View(beanbag);
        }

        //
        // GET: /StoreManager/Delete/5

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
        // POST: /StoreManager/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            BeanBag beanbag = db.BeanBags.Find(id);
            db.BeanBags.Remove(beanbag);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}