using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BlogNew.Areas.Admin.Controllers
{
    public class IndexController : Controller
    {
        // GET: Admin/Index
        public ActionResult Index()
        {
            if (Session["KullaniciId"] != null)
            {
                return View();
            }
            else
            {
                return Redirect("/Admin/Login/Login");
            }
        }
    }
}