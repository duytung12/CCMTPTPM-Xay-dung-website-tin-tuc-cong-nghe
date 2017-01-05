using DAWEB2.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DAWEB2.Controllers
{
    public class AdminController : Controller
    {
        dbLinqDataContext db = new dbLinqDataContext();

        // GET: Admin
        public ActionResult Index()
        {
            var admin = Session["Admin"];
            if (admin == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                admin = User;
            }
            return View();
        }
        public ActionResult QLTheLoai()
        {
            var admin = Session["Admin"];
            if (admin == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            else
            {
                admin = User;
            }
            return View(db.TheLoais.ToList());
        }
        [HttpGet]
        public ActionResult EditTheLoai(int id)
        {
            TheLoai theLoai = db.TheLoais.FirstOrDefault(x => x.idTheLoai == id);
            if (theLoai == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(theLoai);
        }
        [HttpPost]
        public ActionResult EditTheLoai(TheLoai theLoai, HttpPostedFileBase fileUpLoad,FormCollection collection)
        {
            if (ModelState.IsValid)
            {
                if (fileUpLoad == null)
                {
                    var hinhAnh = collection["hinhanh"];
                    theLoai.AnhHien = hinhAnh;
                }
                if (fileUpLoad != null)
                {
                    var fileName = Path.GetFileName(fileUpLoad.FileName);
                    var path = Path.Combine(Server.MapPath("~/TemplateMau/images"), fileName);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.ThongBao = "Hình ảnh đã tồn tại";
                    }
                    else
                    {
                        fileUpLoad.SaveAs(path);
                    }
                    theLoai.AnhHien = fileName;
                    db.TheLoais.InsertOnSubmit(theLoai);
                    db.SubmitChanges();
                }
            }
            return RedirectToAction("QLTheLoai");

        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var tenDN = collection["username"];
            var password = collection["password"];
            if (String.IsNullOrEmpty(tenDN)/* || tenDN.Length > 20*/)
            {
                ViewData["Loi1"] = "Kiểm tra lại tên đăng nhập hoặc mật khẩu";
            }
            else if (String.IsNullOrEmpty(password)/* || password.Length > 15*/)
            {
                ViewData["Loi2"] = "Kiểm tra lại tên đăng nhập hoặc mật khẩu";
            }
            else
            {
                User ad = db.Users.SingleOrDefault(x => x.idUser == tenDN &&
                x.MatKhau == password);
                if (ad != null)
                {
                    Session["Admin"] = ad;
                    return RedirectToAction("Index", "Admin");
                }
                else
                {
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
                }
            }
            return View();
        }
    }
}