using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mandofashion.Models;
namespace DoAnLTW.Areas.PrivatePages.Controllers
{
    public class DashBoardController : Controller
    {
        // GET: PrivatePages/DashBoard
        public ActionResult Index()
        {
            return View();
        }
    }
}