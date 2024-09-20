using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using mandofashion.Models;

namespace mandofashion.Controllers
{
    public class ShoppingCartController : Controller
    {
        private ProductDataBContext dBContext = new ProductDataBContext();
        private string strCart = "Cart";
        // GET: ShoppingCart
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult OrderSuccess()
        {
            return View();
        }

        public ActionResult OrderNow(int? Id)
        {
            if (Id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (Session[strCart] == null)
            {
                List<Cart> ListCart = new List<Cart>
                {
                    new Cart(dBContext.SanPhams.Find(Id),1)
                };
                Session[strCart] = ListCart;
            }
            else
            {
                List<Cart> ListCart = (List<Cart>)Session[strCart];
                int check = IsExistingCheck(Id);
                if (check == -1)
                    ListCart.Add(new Cart(dBContext.SanPhams.Find(Id), 1));
                else
                    ListCart[check].SoLuong++;
                Session[strCart] = ListCart;
            }
            return RedirectToAction("Index");
        }

        private int IsExistingCheck(int? Id)
        {
            List<Cart> ListCart = (List<Cart>)Session[strCart];
            for (int i = 0; i < ListCart.Count; i++)
            {
                if (ListCart[i].SanPham.MaSP == Id)
                    return i;
            }
            return -1;
        }

        public ActionResult RemoveItem(int? Id)
        {
            if (Id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            int check = IsExistingCheck(Id);
            List<Cart> ListCart = (List<Cart>)Session[strCart];
            ListCart.RemoveAt(check);
            if (ListCart.Count == 0)
            {
                Session[strCart] = null;
            }
            else
            {
                Session[strCart] = ListCart;
            }
            return RedirectToAction("Index");
        }
        [HttpPost]
        public ActionResult UpdateCart(FormCollection field)
        {
            string[] soLuongs = field.GetValues("soLuong");
            List<Cart> ListCart = (List<Cart>)Session[strCart];
            for (int i = 0; i < ListCart.Count; i++)
            {
                ListCart[i].SoLuong = Convert.ToInt32(soLuongs[i]);
            }
            Session[strCart] = ListCart;
            return RedirectToAction("Index");
        }

        public ActionResult ClearCart()
        {
            Session[strCart] = null;
            return RedirectToAction("Index");
        }

        public ActionResult CheckOut()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ProcessOrder(FormCollection field)
        {
            List<Cart> ListCart = (List<Cart>)Session[strCart];

            //1. Save the order Into DonHang table
            var order = new mandofashion.Models.DonHang()
            {
                TenKH = field["cusName"],
                SDT = field["cusPhone"],
                Email = field["cusEmail"],
                DiaChi = field["cusAddress"],
                TDDatHang = DateTime.Now,
                GhiChu = "Processing"
            };
            dBContext.DonHangs.Add(order);
            dBContext.SaveChanges();

            //2. Save the order detail into ChiTietSP table
            foreach (Cart cart in ListCart)
            {
                ChiTietDH chiTietDH = new ChiTietDH()
                {
                    MaDH = order.MaDH,
                    MaSP = cart.SanPham.MaSP,
                    SoLuong = Convert.ToInt32(cart.SoLuong),    
                    GiaBan = cart.SanPham.GiaBan
                };
                dBContext.ChiTietDHs.Add(chiTietDH);
                dBContext.SaveChanges();
            }
            //3. Remove shopping cart Session
            Session.Remove(strCart);

            return View("Đặt Hàng Thành Công");
        }
    }
}