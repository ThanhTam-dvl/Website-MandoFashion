using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mandofashion.Models;
using System.IO;

namespace DoAnLTW.Areas.PrivatePages.Controllers
{
    public class NewArticlesController : Controller
    {
        // GET: PrivatePages/NewArticles
        [HttpGet]
        public ActionResult Index()
        {
            BaiViet x = new BaiViet();
            //--thiết lập thông tin cho bài viết 1 cách tự động [Khách quan]
            x.ngayDang = DateTime.Now;
            x.soLanDoc = 0;
            TaiKhoan tk = Session["TtDangNhap"] as TaiKhoan;
            x.taiKhoan = ThuongDung.GetTenTaiKhoan();
            //--Để đưa đường dẫn hình ra ngoài hiển thị trên image
            ViewBag.ddHinh = "~/Images/_0000_h732_2_.jpg";
            return View(x);
        }
        [HttpPost]
        public ActionResult Index(BaiViet x, HttpPostedFileBase HinhDaiDien)
        {
            //--B1: Xử lí thông tin đã nhận từ view
            x.maBV = string.Format("{0:yyMMddhhmm}", DateTime.Now);
            x.daDuyet = false;
            x.ngayDang = DateTime.Now;
            x.taiKhoan = ThuongDung.GetTenTaiKhoan();
            x.soLanDoc = 0;
            x.loaiTin = "QC";
            if (HinhDaiDien != null)
            {
                //Lưu hình vào thư mục chứ bài viết 
                string virPath = "Images/";
                string phyPath = Server.MapPath("~/" + virPath); // Xác định vị trí lưu hình sao khi upload
                string ext = Path.GetExtension(HinhDaiDien.FileName);
                string tenF = "HinhDD" + x.maBV + "." + ext;
                HinhDaiDien.SaveAs(phyPath + tenF); //lưu thì phải dựa vào đường vật lí
                //ghi nhận đường dẫn truy cập tới hình đã lưu trữ dựa vào domain
                x.hinhDD = virPath + tenF;  //đường đẫn ảo theo domain 
                                            //x.hinhDD
                ViewBag.ddHinh = x.hinhDD;
                //sẽ cập nhật hình vừa chọn cho giao diện              
            }
            else
            {
                x.hinhDD = "";
            }
            //--B2: Cập nhật đối tượng bài viết vừa đăng vào model
            ShopOnline_DemoEntities1 db = new ShopOnline_DemoEntities1();
            db.BaiViets.Add(x);
            //--B3: Lưu thông tin xuống Database
            db.SaveChanges();
            return View(x);
        }
    }
}