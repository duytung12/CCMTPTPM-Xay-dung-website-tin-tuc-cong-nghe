using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAWEB2.Models;

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
        public ActionResult TinTucSuKienNoiBat()
        {
            return PartialView(db.Tins.OrderByDescending(x => x.Ngay).Where(x => x.TinNoiBat == true).Take(5));
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
            return View(db.Tins.OrderByDescending(x => x.Ngay).Where(x => x.idLoaiTin == idLT).Take(5));
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
    }
}