using BlogNew.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BlogNew.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        BlogProjectEntities _db = new BlogProjectEntities();
        // GET: Admin/Login
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Logout()
        {
            Session.Clear();
            Session.Abandon();
            return Redirect("/Admin/Login/Login");
        }

        [HttpPost]
        public ActionResult Login(Kullanici model)
        {
            var login = _db.Kullanici.FirstOrDefault(a => a.KullaniciAdi == model.KullaniciAdi && a.Parola == model.Parola && a.Onay == true);
            if (login != null)
            {
                Session["KullaniciId"] = login.Id;
                Session["AdSoyad"] = login.AdSoyad;
                return Redirect("/Admin/Index");
            }
            else
            {
                ViewBag.Message = "Kullanıcı adı veya parola yanlış";
                return View();
            }
        }
    }
}