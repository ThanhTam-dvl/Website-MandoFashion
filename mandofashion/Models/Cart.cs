using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace mandofashion.Models
{
    public class Cart
    {
        public SanPham SanPham { get; set; }
        public int SoLuong { get; set; }

        //Constructor
        public Cart(SanPham sanPham, int soLuong)
        {
            SanPham = sanPham;
            SoLuong = soLuong;
        }
    }
}