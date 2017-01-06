using DAWEB2.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;


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
        #region Danh sách phản hồi
        public ActionResult PhanHoi()
        {
            return View(db.Messages.Where(x => x.TinhTrang == null).ToList());
        }
        #endregion
        #region Trả lời phản hồi
        [HttpGet]
        public ActionResult TraLoi(int id)
        {
            return View(db.Messages.FirstOrDefault(x => x.idMes == id));
        }
        [HttpPost]
        public ActionResult TraLoi(Message mes,FormCollection collec)
        {
            var noidungtraloi = collec["noidungtraloi"];
            var a = db.Messages.FirstOrDefault(x => x.idMes == mes.idMes);
            if (a != null)
            {
                a.TinhTrang = true;
            }
            UpdateModel(mes);
            db.SubmitChanges();
            return RedirectToAction("PhanHoi");
        }
        #endregion
        #region Xóa Tin Tức
        [HttpGet]
        public ActionResult XoaTinTuc(int id)
        {
            var tin = db.Tins.FirstOrDefault(x => x.idTin == id);
            if (tin == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(tin);
        }
        [HttpPost]
        public ActionResult XoaTinTuc(Tin tin)
        {
            var a = db.Tins.FirstOrDefault(x => x.idTin == tin.idTin);
            db.Tins.DeleteOnSubmit(a);
            db.SubmitChanges();
            return RedirectToAction("AllTin");
        }
        #endregion
        #region view sửa tin tức
        [HttpGet]
        public ActionResult SuaTinTuc(int id)
        {
            Tin tin = db.Tins.FirstOrDefault(x => x.idTin == id);
            if (tin == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.idLoaiTin = new SelectList(db.LoaiTins.ToList().OrderBy(n => n.Ten), "idLoaiTin", "Ten", tin.idLoaiTin);
            ViewBag.idTheLoai = new SelectList(db.TheLoais.ToList().OrderBy(n => n.TenTheLoai), "idTheLoai", "TenTheLoai", tin.idTheLoai);
        
            return View(tin);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SuaTinTuc(Tin tin,HttpPostedFileBase urlHinh, HttpPostedFileBase AnhHien)
        {
            var a = db.Tins.FirstOrDefault(x => x.idTin == tin.idTin);
            if (a == null)
            {
                return RedirectToAction("Loi");
            }
            if (a != null)
            {
                ViewBag.idLoaiTin = new SelectList(db.LoaiTins.ToList().OrderBy(n => n.Ten), "idLoaiTin", "Ten");
                ViewBag.idTheLoai = new SelectList(db.TheLoais.ToList().OrderBy(n => n.TenTheLoai), "idTheLoai", "TenTheLoai");
                if (ModelState.IsValid)
                {
                    // hinh trang chu
                    if (urlHinh == null)
                    {
                        tin.urlHinh = a.urlHinh;
                    }
                    if(urlHinh != null)
                    {
                        var fileName = Path.GetFileName(urlHinh.FileName);
                        var path = Path.Combine(Server.MapPath("~/TemplateMau/images"), fileName);
                        if (System.IO.File.Exists(path))
                        {
                            ViewBag.ThongBao = "Hình ảnh đã tồn tại";
                        }
                        else
                        {
                            urlHinh.SaveAs(path);
                        }
                        a.urlHinh = tin.urlHinh = fileName;
                    }
                    // hinh chi tiet
                    if (AnhHien == null)
                    {
                        tin.AnhHien = a.AnhHien;
                    }
                    if (AnhHien != null)
                    {
                        var fileName2 = Path.GetFileName(AnhHien.FileName);
                        var path2 = Path.Combine(Server.MapPath("~/TemplateMau/images"), fileName2);
                        if (System.IO.File.Exists(path2))
                        {
                            ViewBag.ThongBao = "Hình ảnh đã tồn tại";
                        }
                        else
                        {
                            AnhHien.SaveAs(path2);
                        }
                        a.AnhHien = tin.AnhHien = fileName2;
                    }
                    a.TieuDe = tin.TieuDe;
                    a.NoiDung = tin.NoiDung;
                    a.TomTat = tin.TomTat;
                    a.idLoaiTin = tin.idLoaiTin;
                    a.idTheLoai = tin.idTheLoai;
                    a.TinNoiBat = tin.TinNoiBat;
                    UpdateModel(tin);
                    db.SubmitChanges();
                }
            }
            return RedirectToAction("AllTin");
        }
        #endregion
        #region AllTIn
        public ActionResult AllTin(int ? page)
        {
            int pageNum = (page ?? 1);
            int pageSize = 6;
            return View(db.Tins.ToList().ToPagedList(pageNum,pageSize));
        }
        #endregion
        #region DangTin
        [HttpGet]
        public ActionResult DangTin()
        {
            ViewBag.idLoaiTin = new SelectList(db.LoaiTins.ToList().OrderBy(n => n.Ten), "idLoaiTin", "Ten");
            ViewBag.idTheLoai = new SelectList(db.TheLoais.ToList().OrderBy(n => n.TenTheLoai), "idTheLoai", "TenTheLoai");
            return View();
        }
        [HttpPost]
        [ValidateInput(false), AcceptVerbs(HttpVerbs.Post)] 
        public ActionResult DangTin(Tin tin,HttpPostedFileBase urlHinh, HttpPostedFileBase AnhHien)
        {
            ViewBag.idLoaiTin = new SelectList(db.LoaiTins.ToList().OrderBy(n => n.Ten), "idLoaiTin", "Ten");
            ViewBag.idTheLoai = new SelectList(db.TheLoais.ToList().OrderBy(n => n.TenTheLoai), "idTheLoai", "TenTheLoai");

            if (ModelState.IsValid)
            {
                // hinh trang chu
                var fileName = Path.GetFileName(urlHinh.FileName);
                var path = Path.Combine(Server.MapPath("~/TemplateMau/images"), fileName);
                if (System.IO.File.Exists(path))
                {
                    ViewBag.ThongBao = "Hình ảnh đã tồn tại";
                }
                else
                {
                    urlHinh.SaveAs(path);
                }
                tin.urlHinh = fileName;
                // hinh chi tiet
                var fileName2 = Path.GetFileName(AnhHien.FileName);
                var path2 = Path.Combine(Server.MapPath("~/TemplateMau/images"), fileName2);
                if (System.IO.File.Exists(path))
                {
                    ViewBag.ThongBao = "Hình ảnh đã tồn tại";
                }
                else
                {
                    AnhHien.SaveAs(path2);
                }
                tin.AnhHien = fileName2;

                //tin.NoiDung = "tesst";
                tin.Ngay = DateTime.Now;
                tin.idUser = 1 + "";
                tin.SoLanXem = 0;
                db.Tins.InsertOnSubmit(tin);
                db.SubmitChanges();
            }
            return RedirectToAction("AllTin");
        }
        #endregion
        #region QL The Loai
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
        #endregion
        #region Sửa thể loại
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
            var a = db.TheLoais.FirstOrDefault(x => x.idTheLoai == theLoai.idTheLoai);
            if (ModelState.IsValid)
            {
                if (fileUpLoad == null)
                {
                    //var hinhAnh = collection["hinhanh"];
                    a.AnhHien = a.AnhHien;
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
                    a.AnhHien = fileName;
                }
                a.TenTheLoai = theLoai.TenTheLoai;
                UpdateModel(theLoai);
                db.SubmitChanges();
            }
            return RedirectToAction("QLTheLoai");
        }
        #endregion
        #region Xóa thể loại
        [HttpGet]
        public ActionResult DeleteTheLoai(int id)
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
        public ActionResult DeleteTheLoai(TheLoai theLoai)
        {
            var a = db.TheLoais.FirstOrDefault(x => x.idTheLoai == theLoai.idTheLoai);
                db.TheLoais.DeleteOnSubmit(a);
                db.SubmitChanges();
                return RedirectToAction("QLTheLoai");
        }
        #endregion
        #region Đăng nhập
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
                    HttpContext.Session["Admin"] = ad;
                    return RedirectToAction("Index", "Admin");
                }
                else
                {
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
                }
            }
            return View();
        }
        #endregion
        #region themtheloai
        [HttpGet]
        public PartialViewResult ThemMoiTheLoai()
        {
            return PartialView();
        }
        [HttpPost]
        [ValidateInput(false)]
        public PartialViewResult ThemMoiTheLoai(FormCollection collection, HttpPostedFileBase fileUpload)
        {
            if (ModelState.IsValid)
            {
                var theLoai = new TheLoai();
                var tenTheLoai = collection["tentheloai"];
                theLoai.TenTheLoai = tenTheLoai;
                if (fileUpload == null)
                {
                    theLoai.AnhHien = "ChuaCapNhat";
                }
                if (fileUpload != null)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/TemplateMau/images"), fileName);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.ThongBao = "Hình ảnh đã tồn tại";
                    }
                    else
                    {
                        fileUpload.SaveAs(path);
                    }
                    theLoai.AnhHien = fileName;
                }
                db.TheLoais.InsertOnSubmit(theLoai);
                db.SubmitChanges();
            }
            return PartialView(QLTheLoai());
        }
        #endregion
    }
}