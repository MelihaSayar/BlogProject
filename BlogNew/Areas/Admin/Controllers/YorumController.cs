using BlogNew.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BlogNew.Areas.Admin.Controllers
{
    public class YorumController : Controller
    {
        BlogProjectEntities _db = new BlogProjectEntities();
        // GET: Admin/Yorum
        public ActionResult Index()
        {
            var yorumlar = _db.Yorum.ToList();                      
            return View(yorumlar);
        }
    }
}