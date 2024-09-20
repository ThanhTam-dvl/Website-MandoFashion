using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mandofashion.Models;

namespace DoAnLTW.Areas.PrivatePages.Controllers
{
    public class ArticlesController : Controller
    {
        private static ShopOnline_DemoEntities1 db = new ShopOnline_DemoEntities1();
        private static bool daDuyet;
        // GET: PrivatePages/Articles
        [HttpGet]
        public ActionResult Index(string IsActive)
        {
            daDuyet = IsActive != null && IsActive.Equals("1");
            CapNhatDuLieuChoGD();
            return View();
        }
        [HttpPost]
        public ActionResult Delete(string maBaiViet)
        {
            BaiViet x = db.BaiViets.Find(maBaiViet);
            db.BaiViets.Remove(x);
            db.SaveChanges();
            CapNhatDuLieuChoGD();
            return View("Index");
        }
        public ActionResult Active(string maBaiViet)
        {
            BaiViet x = db.BaiViets.Find(maBaiViet);
            x.daDuyet = !daDuyet;
            db.SaveChanges();
            CapNhatDuLieuChoGD();
            return View("Index");
        }
        /// <summary>
        /// Hàm phục vụ việc cập nhật dữ liệu cho View của Controller này thông qua ViewData object 
        /// </summary>
        private void CapNhatDuLieuChoGD()
        {
            List<BaiViet> l = db.BaiViets.Where(x => x.daDuyet == daDuyet).ToList<BaiViet>();
            ViewData["DanhSachBV"] = l;
            ViewBag.tdCuaNut = daDuyet ? "Cấm hiển thị" : "Kiểm duyệt bài";
        }
    }
}