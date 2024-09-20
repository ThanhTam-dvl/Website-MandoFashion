using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mandofashion.Models;
namespace DoAnLTW.Areas.PrivatePages.Controllers
{
    public class CategoriesOfProductsController : Controller
    {
        public static bool isUpdate = false;
        // GET: PrivatePages/CategoriesOfProducts
        [HttpGet]
        public ActionResult Index()
        {
            List<LoaiSP> l = new ShopOnline_DemoEntities1().LoaiSPs.OrderBy(x => x.tenLoai).ToList<LoaiSP>();
            ViewData["DsLoai"] = l;
            return View();
        }
        [HttpPost]
        public ActionResult Index(LoaiSP x)
        {
            ShopOnline_DemoEntities1 db = new ShopOnline_DemoEntities1();
            if (!isUpdate)
                db.LoaiSPs.Add(x);
            else
            {
                LoaiSP y = db.LoaiSPs.Find(x.maLoai);
                y.tenLoai = x.tenLoai;
                y.ghiChu = x.ghiChu;
                isUpdate = false;
            }
            db.SaveChanges();
            if (ModelState.IsValid)
                ModelState.Clear();
            ViewData["DsLoai"] = db.LoaiSPs.OrderBy(z => z.tenLoai).ToList<LoaiSP>();
            return View();
        }
        [HttpPost]
        public ActionResult Delete(string ml)
        {
            ShopOnline_DemoEntities1 db = new ShopOnline_DemoEntities1();
            int ma = int.Parse(ml);
            LoaiSP x = db.LoaiSPs.Find(ma);
            db.LoaiSPs.Remove(x);
            db.SaveChanges();
            ViewData["DsLoai"] = db.LoaiSPs.OrderBy(z => z.tenLoai).ToList<LoaiSP>();
            return View("Index");
        }
        public ActionResult Update(string mlcs)
        {
            ShopOnline_DemoEntities1 db = new ShopOnline_DemoEntities1();
            int ma = int.Parse(mlcs);
            LoaiSP x = db.LoaiSPs.Find(ma);
            isUpdate = true;
            ViewData["DsLoai"] = db.LoaiSPs.OrderBy(z => z.tenLoai).ToList<LoaiSP>();
            return View("Index", x);
        }
    }
}