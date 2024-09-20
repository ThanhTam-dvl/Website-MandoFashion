using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace mandofashion.Areas.PrivatePages.Controllers
{
    public class OrderListsController : Controller
    {
        // GET: PrivatePages/OrderLists
        public ActionResult Index()
        {
            return View();
        }
    }
}