using BlogNew.EF;
using BlogNew.Ortak;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace BlogNew.Controllers
{
    public class HomeController : Controller
    {
        EmailHelper ortak = new EmailHelper();
        BlogProjectEntities _db = new BlogProjectEntities();
        // GET: Index
        public ActionResult Index()
        {
            var makale = _db.Makale.ToList();
            return View(makale);
        }
        public ActionResult Menu()
        {
            var kategori = _db.Kategori.ToList();
            return PartialView(kategori);
        }

        public ActionResult Detay(int id)
        {
            var makale = _db.Makale.Where(i => i.Id == id).FirstOrDefault();
            return View(makale);
        }

        public ActionResult KategoriDetay(int id)
        {
            var k_detay = _db.Makale.Where(i => i.KategoriId == id).ToList();
            return View(k_detay);
        }

        public ActionResult YorumYap(int id)
        {
            Yorum yorum = new Yorum();
            yorum.MakaleId = id;
            return PartialView(yorum);
        }
        [HttpPost]
        public ActionResult YorumYap(Yorum yorum)
        {
            string title="";
            string body="";
            string main;
            try
            {
                yorum.CreateTime = DateTime.Now;
                yorum.Onay = false;
                _db.Yorum.Add(yorum);
                _db.SaveChanges();

                main = "on";
                bool result = false;
                if (main == "on")
                {
                    title = "Blog İletişim.";
                    body = "Merhaba" + yorum.AdSoyad.ToUpper() + ", <br/><br/><p>Mesajınız alınmıştır</p>";

                }
                result = ortak.SendMail(yorum.Email,title, body,true);

                TempData["Issuccess"] = true;
                return RedirectToAction("Detay",new { @id=yorum.MakaleId });
            }
            catch (Exception)
            {                
                TempData["Issuccess"] = false;
                return RedirectToAction("Detay", new { @id = yorum.MakaleId });
            }
            
            
        }

        public ActionResult Yorumlar(int id)
        {
            var yorum = _db.Yorum.Where(i=>i.MakaleId==id).ToList();
            return PartialView(yorum);
        }

        public ActionResult iletisim()
        {
            return View();
        }
       
        [HttpPost]
        public ActionResult SendMailToUser(string Email, string title, string body, string main, string AdSoyad, Iletisim model)
        {
            

            _db.Iletisim.Add(model);
            _db.SaveChanges();

            main = "on";
            bool result = false;            
            if (main == "on") { title = "Blog İletişim."; body = "Merhaba" + model.AdSoyad.ToUpper() +"<br>Email:"+ model.Email + ", <br/><br/>" + model.Mesaj.ToString(); }
            result = ortak.SendMail("",title, body,false);           

            return RedirectToAction("Index");
        }

        

    }
}