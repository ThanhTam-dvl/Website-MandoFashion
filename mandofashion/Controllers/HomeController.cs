using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mandofashion.Models;

namespace mandofashion.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            ProductDataBContext dBContext = new ProductDataBContext();
            List<SanPham> ListSanPhams = dBContext.SanPhams.Take(8).ToList();
            return View(ListSanPhams);
        }

        public ActionResult About()
        {
            return View();
        }
    }
}