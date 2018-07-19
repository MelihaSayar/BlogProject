using BlogNew.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BlogNew.Areas.Admin.Controllers
{
    public class KategoriController : Controller
    {
        BlogProjectEntities _db = new BlogProjectEntities();
        // GET: Admin/Kategori
        public ActionResult Index()
        {       
            var kategoriler = _db.Kategori.ToList();
            return View(kategoriler);
        }
        public ActionResult ekle()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ekle(Kategori model)
        {
            model.CreateTime = DateTime.Now;
            model.CreateUserId = Convert.ToInt32(Session["Kullaniciid"].ToString());
            _db.Kategori.Add(model);
            _db.SaveChanges();
            return View();
        }
        public ActionResult Duzenle(int id)
        {
            var kategori = _db.Kategori.Where(i => i.Id == id).FirstOrDefault();
            return View(kategori);
        }
        [HttpPost]
        public ActionResult Duzenle(int id, Kategori model)
        {
            var kategori = _db.Kategori.Where(i => i.Id == id).FirstOrDefault();
            kategori.KategoriAdi = model.KategoriAdi;
            kategori.Sira = model.Sira;
            _db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Sil(int id)
        {
            if (id==1)
            {
                TempData["Result"] = "Bu Kategoriyi Silemezsiniz";
                TempData["Issuccess"] = false;
                return RedirectToAction("Index");
            }
            else
            {
                var makale = _db.Makale.Where(a => a.KategoriId == id).ToList();
                foreach (var item in makale)
                {
                    item.KategoriId = 1;
                    _db.SaveChanges();
                }

                var kategori = _db.Kategori.Where(i => i.Id == id).FirstOrDefault();
                _db.Kategori.Remove(kategori);
                _db.SaveChanges();
                TempData["Result"] = "İşleminiz Tamamlanmıştır";
                TempData["Issuccess"] = true;
                return RedirectToAction("Index");
            }

            
        }
        
    }
}