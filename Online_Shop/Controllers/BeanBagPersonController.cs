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
    public class BeanBagPersonController : Controller
    {
        private BeanBagDBContext db = new BeanBagDBContext();

        //
        // GET: /BeanBagPerson/

        public ActionResult Index()
        {
            return View(db.BeanBagPersons.ToList());
        }

        //
        // GET: /BeanBagPerson/Details/5

        public ActionResult Details(int id = 0)
        {
            BeanBagPerson beanbagpersonmodels = db.BeanBagPersons.Find(id);
            if (beanbagpersonmodels == null)
            {
                return HttpNotFound();
            }
            return View(beanbagpersonmodels);
        }

        //
        // GET: /BeanBagPerson/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /BeanBagPerson/Create

        [HttpPost]
        public ActionResult Create(BeanBagPerson beanbagpersonmodels)
        {
            if (ModelState.IsValid)
            {
                db.BeanBagPersons.Add(beanbagpersonmodels);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(beanbagpersonmodels);
        }

        //
        // GET: /BeanBagPerson/Edit/5

        public ActionResult Edit(int id = 0)
        {
            BeanBagPerson beanbagpersonmodels = db.BeanBagPersons.Find(id);
            if (beanbagpersonmodels == null)
            {
                return HttpNotFound();
            }
            return View(beanbagpersonmodels);
        }

        //
        // POST: /BeanBagPerson/Edit/5

        [HttpPost]
        public ActionResult Edit(BeanBagPerson beanbagpersonmodels)
        {
            if (ModelState.IsValid)
            {
                db.Entry(beanbagpersonmodels).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(beanbagpersonmodels);
        }

        //
        // GET: /BeanBagPerson/Delete/5

        public ActionResult Delete(int id = 0)
        {
            BeanBagPerson beanbagpersonmodels = db.BeanBagPersons.Find(id);
            if (beanbagpersonmodels == null)
            {
                return HttpNotFound();
            }
            return View(beanbagpersonmodels);
        }

        //
        // POST: /BeanBagPerson/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            BeanBagPerson beanbagpersonmodels = db.BeanBagPersons.Find(id);
            db.BeanBagPersons.Remove(beanbagpersonmodels);
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