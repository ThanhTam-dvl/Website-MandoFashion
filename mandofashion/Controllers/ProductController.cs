using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mandofashion.Models;

namespace mandofashion.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index(int maLoai = 1)
        {
            ProductDataBContext dbContext = new ProductDataBContext();
            List<SanPham> Listproducts = dbContext.SanPhams
                                            .Include(cat => cat.LoaiSP)
                                            .Where(pro => pro.MaLoai == maLoai)
                                            .ToList();
            return View(Listproducts); 
        }


        public ActionResult Detail(int id)
        {
            ProductDataBContext dBContext = new ProductDataBContext();
            SanPham product = dBContext.SanPhams.Include(cat => cat.LoaiSP).FirstOrDefault(x => x.MaSP == id);
            return View(product);
        }

    }
}