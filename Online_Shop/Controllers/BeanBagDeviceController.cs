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
    public class BeanBagDeviceController : Controller
    {
        private BeanBagDBContext db = new BeanBagDBContext();

        //
        // GET: /BeanBagDevice/

        public ActionResult Index()
        {
            return View(db.BeanBagDevices.ToList());
        }

        //
        // GET: /BeanBagDevice/Details/5

        public ActionResult Details(int id = 0)
        {
            BeanBagDevice beanbagdevice = db.BeanBagDevices.Find(id);
            if (beanbagdevice == null)
            {
                return HttpNotFound();
            }
            return View(beanbagdevice);
        }

        //
        // GET: /BeanBagDevice/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /BeanBagDevice/Create

        [HttpPost]
        public ActionResult Create(BeanBagDevice beanbagdevice)
        {
            if (ModelState.IsValid)
            {
                db.BeanBagDevices.Add(beanbagdevice);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(beanbagdevice);
        }

        //
        // GET: /BeanBagDevice/Edit/5

        public ActionResult Edit(int id = 0)
        {
            BeanBagDevice beanbagdevice = db.BeanBagDevices.Find(id);
            if (beanbagdevice == null)
            {
                return HttpNotFound();
            }
            return View(beanbagdevice);
        }

        //
        // POST: /BeanBagDevice/Edit/5

        [HttpPost]
        public ActionResult Edit(BeanBagDevice beanbagdevice)
        {
            if (ModelState.IsValid)
            {
                db.Entry(beanbagdevice).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(beanbagdevice);
        }

        //
        // GET: /BeanBagDevice/Delete/5

        public ActionResult Delete(int id = 0)
        {
            BeanBagDevice beanbagdevice = db.BeanBagDevices.Find(id);
            if (beanbagdevice == null)
            {
                return HttpNotFound();
            }
            return View(beanbagdevice);
        }

        //
        // POST: /BeanBagDevice/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            BeanBagDevice beanbagdevice = db.BeanBagDevices.Find(id);
            db.BeanBagDevices.Remove(beanbagdevice);
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