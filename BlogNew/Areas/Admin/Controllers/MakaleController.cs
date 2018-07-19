using BlogNew.EF;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BlogNew.Areas.Admin.Controllers
{
    public class MakaleController : Controller
    {
        BlogProjectEntities veritabani = new BlogProjectEntities();
        // GET: Admin/Makale
        public ActionResult Index()
        {
            var makaleler = veritabani.Makale.ToList();
            return View(makaleler);
        }
        public ActionResult Ekle()
        {
            ViewBag.Kategoriler = new SelectList(veritabani.Kategori.ToList(), "Id", "KategoriAdi");
            return View();
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Ekle(Makale model, HttpPostedFileBase resim)
        {
            
            string filename = Guid.NewGuid().ToString()+ Path.GetExtension(resim.FileName);

            string filepath = Server.MapPath("~/Content/Upload/" + filename);
            resim.SaveAs(filepath);
            model.Resim = filename;

            model.Hit = 0;
            model.CreateTime = DateTime.Now;
            model.CreateUserId = Convert.ToInt32(Session["Kullaniciid"].ToString());
            ViewBag.Kategoriler = new SelectList(veritabani.Kategori.ToList(), "Id", "KategoriAdi");
            veritabani.Makale.Add(model);
            veritabani.SaveChanges();
            return View();
        }

        public ActionResult Duzenle(int id)
        {
            var makale = veritabani.Makale.Where(i => i.Id == id).FirstOrDefault();
            ViewBag.Kategoriler = new SelectList(veritabani.Kategori.ToList(), "Id", "KategoriAdi");
            return View(makale);
        }

        [HttpPost]
        public ActionResult Duzenle(Makale model, HttpPostedFileBase resim)
        {
            var makale = veritabani.Makale.Where(i => i.Id == model.Id).FirstOrDefault();
            if (makale!=null)
            {
                if (makale.Resim!=null)
                {
                    FileInfo fi = new FileInfo(Server.MapPath("~/Content/Upload/" + makale.Resim));
                    if (fi != null)
                    {
                        fi.Delete();
                    }
                }
                makale.MakaleAdi = model.MakaleAdi;
                makale.MakaleOzeti = model.MakaleOzeti;
                makale.MakaleDetayi = model.MakaleDetayi;
                makale.KategoriId = model.KategoriId;

                string filename = Guid.NewGuid().ToString() + Path.GetExtension(resim.FileName);
                string filepath = Server.MapPath("~/Content/Upload/" + filename);
                resim.SaveAs(filepath);

                model.Resim = filename;
                makale.Resim = model.Resim;
                veritabani.SaveChanges();
            }

            return RedirectToAction("Index");
        }

        public ActionResult Sil(int id)
        {
            Makale makale = veritabani.Makale.Where(i => i.Id == id).FirstOrDefault();
            try
            {
                if (makale != null)
                {
                    List<Yorum> yorumlar = veritabani.Yorum.Where(i => i.MakaleId == id).ToList();
                    foreach (Yorum yorum in yorumlar)
                    {
                        veritabani.Yorum.Remove(yorum);
                        veritabani.SaveChanges();
                    }
                    veritabani.Makale.Remove(makale);
                    veritabani.SaveChanges();
                    TempData["Result"] = "İşleminiz Başarılı Bir Şekilde Gerçekleşmiştir";
                    TempData["Issuccess"] = true;
                }
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                TempData["Result"] = "Bir Hata Oluştu!!! Lütfen Tekrar Deneyiniz";
                TempData["Issuccess"] = false;
                return RedirectToAction("Index");
            }
            
        }
    }
}