using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mandofashion.Models;
namespace mandofashion.Areas.PrivatePages.Controllers
{
    public class LoginController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(String Acc, string Pass)
        {
            string mk = MaHoa.encryptSHA256(Pass);
            TaiKhoan ttdn = new ShopOnline_DemoEntities1().TaiKhoans.Where(x => x.taiKhoan1.Equals(Acc.ToLower().Trim()) && x.matKhau.Equals(mk)).First<TaiKhoan>();
            bool isAuthentic = ttdn != null && ttdn.taiKhoan1.Equals(Acc.ToLower().Trim()) && ttdn.matKhau.Equals(mk);
            if (isAuthentic)
            {
                Session["TtDangNhap"] = ttdn;
                return RedirectToAction("Index", "Dashboard", new { Area = "PrivatePages" });
            }
            return View();
        }
    }
}