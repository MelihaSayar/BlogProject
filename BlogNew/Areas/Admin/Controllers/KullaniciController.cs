using BlogNew.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BlogNew.Areas.Admin.Controllers
{
    public class KullaniciController : Controller
    {
        BlogProjectEntities _db = new BlogProjectEntities();
        // GET: Admin/Kullanici
        public ActionResult Index()
        {
            var kullanicilar = _db.Kullanici.Where(a=>a.Onay==true).ToList();
            return View(kullanicilar);
        }
        public ActionResult Ekle()
        {
            ViewBag.Yetkiler = new SelectList(_db.KullaniciYetki.ToList(), "id", "YetkiAdi");
            return View();
        }
        [HttpPost]
        public ActionResult Ekle(Kullanici model)
        {
            try
            {
                _db.Kullanici.Add(model);
                _db.SaveChanges();
                ViewBag.Result = "İşleminiz Başarılı Bir Şekilde Gerçekleşmiştir";
                ViewBag.issucces = true;
            }
            catch (Exception)
            {
                ViewBag.issucces = false;
                ViewBag.Result = "Bir Hata Oluştu!!! Lütfen Tekrar Deneyiniz";
            }
            
            ViewBag.Yetkiler = new SelectList(_db.KullaniciYetki.ToList(), "id", "YetkiAdi");
            
            return View();
        }

        public ActionResult Duzenle(int id)
        {
            var kullanici = _db.Kullanici.Where(i => i.Id == id).FirstOrDefault();
            ViewBag.Yetkiler = new SelectList(_db.KullaniciYetki.ToList(), "id", "YetkiAdi");
            return View(kullanici);
        }

        [HttpPost]
        public ActionResult Duzenle(int id, Kullanici model)
        {
            var kullanici = _db.Kullanici.Where(i => i.Id == id).FirstOrDefault();

            kullanici.KullaniciAdi = model.KullaniciAdi;
            kullanici.AdSoyad = model.AdSoyad;
            kullanici.Email = model.Email;
            kullanici.Yetki = model.Yetki;
            kullanici.Parola = model.Parola;
            kullanici.Onay = model.Onay;
            //ViewBag.Yetki = new SelectList(_db.KullaniciYetki.ToList(), "id", "YetkiAdi"); REturn View() yazarsak kullanabiliriz
            _db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Sil(int id)
        {
            var kullanici = _db.Kullanici.Where(i => i.Id == id).FirstOrDefault();            

            if (kullanici.KullaniciAdi != null)
            {                             
                kullanici.Onay = false;
                _db.SaveChanges();                
            }

            return RedirectToAction("Index");
        }

      
    }
}