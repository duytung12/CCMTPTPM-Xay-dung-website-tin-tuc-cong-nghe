using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAWEB2.Models;
using PagedList;
using PagedList.Mvc;
using System.Web.Http;
using System.Text;
using System.Globalization;
using System.Text.RegularExpressions;

namespace DAWEB2.Controllers
{
    public class TrangChuController : Controller
    {
        // GET: TrangChu
        dbLinqDataContext db = new dbLinqDataContext();
        public ActionResult ViewMenuTop()
        { // ptView nay dung de load loai tin vao menutop
            var loaiTin = db.LoaiTins.ToList();
            return PartialView(loaiTin);
        }
        public ActionResult ViewBannerTop()
        { //ptView nay dung de load 5 tin moi nhat vào banertop
            var tin = db.Tins.OrderByDescending(x => x.Ngay).Take(5);
            return PartialView(tin);
        }
        public List<Tin> lay5TinMoi()
        {
            return db.Tins.OrderByDescending(x => x.Ngay).Take(5).ToList();
        }
        public ActionResult Index()
        {
            var tin = lay5TinMoi();
            return View(tin);
        }
        public ActionResult Lay1TinCongNgheTheGioi()
        {
            var tinCNTG = db.Tins.Where(x => x.idLoaiTin == 6).OrderByDescending(x => x.Ngay).Take(1);
            return PartialView(tinCNTG);
        }
        public ActionResult View4tinCNTG()
        {
            return PartialView(db.Tins.OrderByDescending(x => x.Ngay).Where(x => x.idLoaiTin == 6).Take(4));
        }
        public ActionResult Lay1TinCNTN()
        {
            var tinCNTN = db.Tins.Where(x => x.idLoaiTin == 5).OrderByDescending(x => x.Ngay).Take(1);
            return PartialView(tinCNTN);
        }
        public ActionResult View4tinCNTN()
        {
            return PartialView(db.Tins.OrderByDescending(x => x.Ngay).Where(x => x.idLoaiTin == 5).Take(4));
        }
        public ActionResult Lay1TinGameOnline()
        {
            var tinCNTN = db.Tins.Where(x => x.idLoaiTin == 1).OrderByDescending(x => x.Ngay).Take(1);
            return PartialView(tinCNTN);
        }
        public ActionResult View4tinGameOnline()
        {
            return PartialView(db.Tins.OrderByDescending(x => x.Ngay).Where(x => x.idLoaiTin == 1).Take(4));
        }
        public ActionResult Lay1TinGameOffline()
        {
            var tinCNTN = db.Tins.Where(x => x.idLoaiTin == 4).OrderByDescending(x => x.Ngay).Take(1);
            return PartialView(tinCNTN);
        }
        public ActionResult View4tinGameOffline()
        {
            return PartialView(db.Tins.OrderByDescending(x => x.Ngay).Where(x => x.idLoaiTin == 4).Take(4));
        }
        // cac tin hot la lay dua vao so lan xem
        public ActionResult Lay1TinCNTGHot()
        {
            var tinCNTN = db.Tins.Where(x => x.idLoaiTin == 6).OrderByDescending(x => x.SoLanXem).Take(1);
            return PartialView(tinCNTN);
        }
        public ActionResult View4tinCNTGHot()
        {
            return PartialView(db.Tins.OrderByDescending(x => x.SoLanXem).Where(x => x.idLoaiTin == 6).Take(4));
        }
        public ActionResult Lay1TinCNTNHot()
        {
            var tinCNTN = db.Tins.Where(x => x.idLoaiTin == 5).OrderByDescending(x => x.SoLanXem).Take(1);
            return PartialView(tinCNTN);
        }
        public ActionResult View4tinCNTNHot()
        {
            return PartialView(db.Tins.OrderByDescending(x => x.SoLanXem).Where(x => x.idLoaiTin == 5).Take(4));
        }
        public ActionResult Lay1TinGameOnHot()
        {
            var tinCNTN = db.Tins.Where(x => x.idLoaiTin == 1).OrderByDescending(x => x.SoLanXem).Take(1);
            return PartialView(tinCNTN);
        }
        public ActionResult View4tinGameOnHot()
        {
            return PartialView(db.Tins.OrderByDescending(x => x.SoLanXem).Where(x => x.idLoaiTin == 1).Take(4));
        }
        public ActionResult Lay1TinGameOfHot()
        {
            var tinCNTN = db.Tins.Where(x => x.idLoaiTin == 4).OrderByDescending(x => x.SoLanXem).Take(1);
            return PartialView(tinCNTN);
        }
        public ActionResult View4tinGameOfHot()
        {
            return PartialView(db.Tins.OrderByDescending(x => x.SoLanXem).Where(x => x.idLoaiTin == 4).Take(4));
        }
        public ActionResult TinTucSuKienNoiBat(int? page)
        {
            int pageSize = 5;
            int pageNum = (page ?? 1);
            return PartialView(db.Tins.OrderByDescending(x => x.Ngay).Where(x => x.TinNoiBat == true).
                Take(15).ToPagedList(pageNum, pageSize));
            //return PartialView(db.Tins.OrderByDescending(x => x.Ngay).Where(x => x.TinNoiBat == true).Take(5));
        }

        public ActionResult CTTin(int id)
        {
            EditSoLanXem(id);
            return View(db.Tins.FirstOrDefault(x => x.idTin == id));
        }
        public ActionResult CungChuyenMucTrangCTTin(int id)
        {
            var a = db.Tins.FirstOrDefault(x => x.idTin == id);
            return PartialView(db.Tins.OrderByDescending(x => x.Ngay).Where(x => x.idLoaiTin == a.idLoaiTin && x.idTin != id).Take(3));
        }
        public ActionResult TrangLoaiTin(int idLT)
        {

            return View(db.Tins.OrderByDescending(x => x.Ngay)
                .Where(x => x.idLoaiTin == idLT).Take(5));
        }
        public void EditSoLanXem(int id)
        {
            var a = db.Tins.FirstOrDefault(x => x.idTin == id);
            a.SoLanXem += 1;
            UpdateModel(db);
            db.SubmitChanges();
        }
        public ActionResult contact()
        {
            return View();
        }
        #region bổ sung 
        public ActionResult ViewMenuTopLayTheLoai()
        { // ptView nay dung de load loai tin vao menutop
            var theLoai = db.TheLoais.ToList();
            return PartialView(theLoai);
        }
        public ActionResult TrangTheloai(int idTL)
        {
            return View(db.Tins.OrderByDescending(x => x.Ngay)
                .Where(x => x.idTheLoai == idTL).Take(5));
        }
        public string PTVLayTieuDeTheLoai(int idTL)
        {
            return db.Tins.FirstOrDefault(x => x.idTheLoai == idTL).TheLoai.TenTheLoai;
        }
        public ActionResult PTVDanhMucTinTheoLoaiTin(int idTL) // dùng cho trang Thể loại - đáng lẽ là theo thể loại mà ghi nhầm
        {
            return PartialView(db.LoaiTins.Where(x => x.idTheLoai == idTL).ToList());
        }
        public ActionResult PTVDanhMucTinTheoLoaiTin1(int idLT) // dùng cho trang Loại tin
        {
            int layidTheLoai = db.Tins.FirstOrDefault(x => x.idLoaiTin == idLT).TheLoai.idTheLoai;
            return PartialView(db.LoaiTins.Where(x => x.idTheLoai == layidTheLoai).ToList());
        }
        public ActionResult PTVTinNoiBat() // dùng cho trang thể loại,loại tin
        {
            return PartialView(db.Tins.OrderByDescending(x => x.Ngay).Where(x => x.TinNoiBat == true).
              Take(5));
        }
        public string PTVLayTieuDeLoaiTin(int idLT)
        {
            return db.Tins.FirstOrDefault(x => x.idLoaiTin == idLT).LoaiTin.Ten;
        }
        [System.Web.Mvc.HttpGet]
        public PartialViewResult PTVTimKiem()
        {
            return PartialView();
        }
        [System.Web.Mvc.HttpPost]
        public PartialViewResult PTVTimKiem(FormCollection collec)
        {
            string tuKhoaTimKiem = collec["timkiem"];
            string timchuaLower = RemoveUnicode(tuKhoaTimKiem);
            if (timchuaLower == null) return null;
            string timdaLower = timchuaLower.ToLower();
            Response.Redirect("~/TrangChu/TimKiem?id=" + timdaLower);
            return PartialView();
        }
        public static string RemoveUnicode(string s) // đổi chữ có dấu sang ko dấu 
        {
            if (s == null)
            { return null; }
            string stFormD = s.Normalize(NormalizationForm.FormD);
            StringBuilder sb = new StringBuilder();
            for (int ich = 0; ich < stFormD.Length; ich++)
            {
                UnicodeCategory uc = CharUnicodeInfo.GetUnicodeCategory(stFormD[ich]);
                if (uc != UnicodeCategory.NonSpacingMark)
                    sb.Append(stFormD[ich]);
            }
            return (sb.ToString().Normalize(NormalizationForm.FormC));
        }
        #region Ham kiem tra email
        static public bool EmailHopLe(string email)
        {
            if (email == null) return false;
            string emailRegex = @"^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$";
            Regex re = new Regex(emailRegex);
            return re.IsMatch(email);
        }
        #endregion
        public ActionResult TimKiem(string id)
        {
            var a = db.Tins.ToList();
            List<Tin> listTinCanTim = new List<Tin>();
            foreach (var i in a)
            {
                string tenTinCanTimChuaLower = RemoveUnicode(i.TieuDe);
                string tenTinCanTimDaLower = tenTinCanTimChuaLower.ToLower();
                if (tenTinCanTimDaLower.Contains(id))
                {
                    listTinCanTim.Add(i);
                }
            }
            return View(listTinCanTim);
        }


        public ActionResult TrangXemNhieu()
        {
            var timXemNhieu = db.Tins.OrderByDescending(x => x.SoLanXem).Take(6);
            return View(timXemNhieu);
        }

        #endregion
    }
}