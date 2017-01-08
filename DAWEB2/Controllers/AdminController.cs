using DAWEB2.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
using System.Net.Mail;
using System.Net;


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
            return View();
        }

        #region Quản lý phân quyền
        public ActionResult QLPhanQuyen()
        {
            KiemTraQuyen();
            return View(db.VaiTros.Where(x => x.MaVT != 1).ToList());
        }

        #endregion

        #region Xem các quyền ứng vs các trang web ....
        [HttpGet]
        public ActionResult PQuyen(int id)
        {
            var phanQuyen = db.PhanQuyens.Where(x => x.MaVT == id).ToList();
            return View(phanQuyen);
        }
        #endregion

        #region bắt đầu chỉnh sửa quyền

        public ActionResult SuaQuyen(int id)
        {
            return View(db.PhanQuyens.FirstOrDefault(x => x.MaPQ == id));
        }
        [HttpPost]
        public ActionResult SuaQuyen(int id, PhanQuyen pq)
        {
            var a = db.PhanQuyens.FirstOrDefault(x => x.MaPQ == id);
            a.DuocPhep = pq.DuocPhep;
            UpdateModel(a);
            db.SubmitChanges();
            Response.Redirect("~/Admin/PQuyen/" + a.MaVT);
            return View();
        }
        #endregion

        #region QL Vai trò
        public ActionResult QLVaiTro()
        {
            KiemTraQuyen();
            return View(db.VaiTros.Where(x => x.MaVT != 1).ToList());
        }
        #endregion

        #region Thêm vai trò
        [HttpGet]
        public ActionResult ThemVT()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemVT(VaiTro vaiTro)
        {
            db.VaiTros.InsertOnSubmit(vaiTro);
            db.SubmitChanges();

            for (int i = 1; i < 10; i++)
            { // cái này dùng để khi vừa tạo mới 1 vai trò thì vai trò này sẽ được mặc định quyền vào
              // 9 trang đều là false. Mún chỉnh sửa quyền cho vai trò mới này thì vào quản lý phân quyền 
              // để chỉnh sửa -  và người chỉnh sửa phải là admin.
                PhanQuyen a = new PhanQuyen();
                a.MaTW = i;
                a.MaVT = vaiTro.MaVT;
                a.DuocPhep = false;
                db.PhanQuyens.InsertOnSubmit(a);
                db.SubmitChanges();
            }
            return RedirectToAction("QLVaiTro");
        }
        #endregion

        #region Sửa vai trò
        [HttpGet]
        public ActionResult SuaVT(int id)
        {
            return View(db.VaiTros.FirstOrDefault(x => x.MaVT == id));
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SuaVT(VaiTro vaiTro, int id)
        {
            var a = db.VaiTros.FirstOrDefault(x => x.MaVT == id);
            if (a != null)
            {
                a.TenVT = vaiTro.TenVT;
                a.MoTa = "chuaco";
            }
            UpdateModel(a);
            db.SubmitChanges();
            return RedirectToAction("QLVaiTro");
        }
        #endregion

        #region Xóa vai trò
        [HttpGet]
        public ActionResult XoaVT(int id)
        {
            VaiTro vaiTro = db.VaiTros.FirstOrDefault(x => x.MaVT == id);
            if (vaiTro == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(vaiTro);
        }
        [HttpPost]
        public ActionResult XoaVT(int id, FormCollection collection)
        {
            var c = db.Users.FirstOrDefault(x => x.MaVT == id); // dùng để ko cho xóa khi còn nhân viên 
            //đảm nhận chức vụ này
            if (c != null) return View();

            var a = db.VaiTros.FirstOrDefault(x => x.MaVT == id);
            for (int i = 1; i < 10; i++)
            { // cái này dùng để xóa hết tất cả những cái đã phân quyền trước đó cho vai trò này.Xóa trong
                // bảng phân quyền
                PhanQuyen ab = db.PhanQuyens.FirstOrDefault(x => x.MaTW == i && x.MaVT == id);
                db.PhanQuyens.DeleteOnSubmit(ab);
                db.SubmitChanges();
            }
            db.VaiTros.DeleteOnSubmit(a);
            db.SubmitChanges();
            return RedirectToAction("QLVaiTro");
        }

        #endregion

        #region QL Nhân viên
        public ActionResult QLNhanVien()
        {
            KiemTraQuyen();
            //User admin = (User)Session["Admin"];
            //if (admin.idUser != "admin")
            //    return null;
            return View(db.Users.Where(x => x.Active == true && x.MaVT != 1).ToList());
        }
        #endregion

        #region Thêm nhân viên
        [HttpGet]
        public ActionResult ThemNV()
        {
            ViewBag.MaVT = new SelectList(db.VaiTros.ToList().OrderBy(n => n.TenVT), "MaVT", "TenVT");
            return View();
        }
        [HttpPost]
        public ActionResult ThemNV(User user, FormCollection collec)
        {
            ViewBag.MaVT = new SelectList(db.VaiTros.ToList().OrderBy(n => n.TenVT), "MaVT", "TenVT");
            var tenDN = collec["idUser"];
            var kiemTraId = db.Users.FirstOrDefault(x => x.idUser == tenDN);
            if (kiemTraId != null)
            {
                //ViewData["ThongBao"] = "id đã được sử dụng .. !";
                ViewBag.ThongBao = "Id đã được sử dụng .. !";
                return View();
            }
            if (kiemTraId == null)
            {
                user.NgayDangKi = DateTime.Today;
                user.idGroup = 1;
                user.Active = true;
                db.Users.InsertOnSubmit(user);
                db.SubmitChanges();
                return RedirectToAction("QLNhanVien");
            }
            return View();
        }
        #endregion

        #region Sửa nhân viên
        [HttpGet]
        public ActionResult SuaNV(string id)
        {
            User user = db.Users.FirstOrDefault(x => x.idUser == id);
            if (user == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaVT = new SelectList(db.VaiTros.ToList().OrderBy(n => n.TenVT), "MaVT", "TenVT", user.MaVT);
            return View(user);
        }
        [HttpPost]
        public ActionResult SuaNV(string id, User user)
        {
            var timNV = db.Users.FirstOrDefault(x => x.idUser == id);
            if (timNV != null)
            {
                ViewBag.MaVT = new SelectList(db.VaiTros.ToList().OrderBy(n => n.TenVT), "MaVT", "TenVT");
                UpdateModel(timNV);
                db.SubmitChanges();
            }
            return RedirectToAction("QLNhanVien");
        }
        #endregion

        #region Xóa nhân viên ( Chỉnh lại active = false)
        [HttpGet]
        public ActionResult XoaNV(string id)
        {
            User user = db.Users.FirstOrDefault(x => x.idUser == id);
            if (user == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(user);
        }
        [HttpPost]
        public ActionResult XoaNV(string id, User user)
        {
            var timNV = db.Users.FirstOrDefault(x => x.idUser == id);
            if (timNV != null)
            {
                timNV.Active = false;
                UpdateModel(timNV);
                db.SubmitChanges();
            }
            return RedirectToAction("QLNhanVien");
        }
        #endregion

        #region QL LoaiTin
        public ActionResult QLLoaiTin()
        {
            KiemTraQuyen();
            return View(db.LoaiTins.ToList());
        }
        #endregion

        #region ThemLoaiTin
        [HttpGet]
        public ActionResult ThemLoaiTin()
        {
            ViewBag.idTheLoai = new SelectList(db.TheLoais.ToList().OrderBy(n => n.TenTheLoai), "idTheLoai", "TenTheLoai");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemLoaiTin(LoaiTin loaiTin)
        {
            ViewBag.idLoaiTin = new SelectList(db.LoaiTins.ToList().OrderBy(n => n.Ten), "idLoaiTin", "Ten");
            loaiTin.AnhHien = "chuaco";
            db.LoaiTins.InsertOnSubmit(loaiTin);
            db.SubmitChanges();
            return RedirectToAction("QLLoaiTin");
        }
        #endregion

        #region sửa loại tin
        [HttpGet]
        public ActionResult SuaLoaiTin(int id)
        {
            //ViewBag.idTheLoai = new SelectList(db.TheLoais.ToList().OrderBy(n => n.TenTheLoai), "idTheLoai", "TenTheLoai");
            LoaiTin loaiTin = db.LoaiTins.FirstOrDefault(x => x.idLoaiTin == id);
            if (loaiTin == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.idTheLoai = new SelectList(db.TheLoais.ToList().OrderBy(n => n.TenTheLoai), "idTheLoai", "TenTheLoai", loaiTin.idTheLoai);
            return View(loaiTin);
        }
        [HttpPost]
        public ActionResult SuaLoaiTin(int id, LoaiTin loaiTin)
        {
            var a = db.LoaiTins.FirstOrDefault(x => x.idLoaiTin == id);
            if (a != null)
            {
                a.Ten = loaiTin.Ten;
                a.AnhHien = "chuaco";
                a.idTheLoai = loaiTin.idTheLoai;
            }
            UpdateModel(a);
            db.SubmitChanges();
            return RedirectToAction("QLLoaiTin");
        }
        #endregion

        #region Xóa loại tin
        [HttpGet]
        public ActionResult XoaLoaiTin(int id)
        {
            LoaiTin loaiTin = db.LoaiTins.FirstOrDefault(x => x.idLoaiTin == id);
            if (loaiTin == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.idTheLoai = new SelectList(db.TheLoais.ToList().OrderBy(n => n.TenTheLoai), "idTheLoai", "TenTheLoai", loaiTin.idTheLoai);
            return View(loaiTin);
        }
        [HttpPost]
        public ActionResult XoaLoaiTin(int id, FormCollection collection)
        {
            var a = db.LoaiTins.FirstOrDefault(x => x.idLoaiTin == id);
            db.LoaiTins.DeleteOnSubmit(a);
            db.SubmitChanges();
            return RedirectToAction("QLLoaiTin");
        }
        #endregion

        #region DS Email đăng ký
        public ActionResult EmailDK(int? page)
        {
            KiemTraQuyen();
            int pageNum = (page ?? 1);
            int pageSize = 6;
            return View(db.DSMails.ToList().ToPagedList(pageNum, pageSize));
        }
        #endregion

        #region Danh sách phản hồi
        public ActionResult PhanHoi()
        {
            KiemTraQuyen();
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
        public ActionResult TraLoi(Message mes, FormCollection collec)
        {
            var noidungtraloi = collec["noidungtraloi"];
            SendGmail(mes.Email, "Công Nghệ 24h -  Trả lời phản hồi", noidungtraloi, null);
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
        public ActionResult SuaTinTuc(Tin tin, HttpPostedFileBase urlHinh, HttpPostedFileBase AnhHien)
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
                    if (urlHinh != null)
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
        public ActionResult AllTin(int? page)
        {
            KiemTraQuyen();
            int pageNum = (page ?? 1);
            int pageSize = 6;
            return View(db.Tins.ToList().ToPagedList(pageNum, pageSize));
        }
        #endregion

        #region DangTin
        [HttpGet]
        public ActionResult DangTin()
        {
            KiemTraQuyen();
            ViewBag.idLoaiTin = new SelectList(db.LoaiTins.ToList().OrderBy(n => n.Ten), "idLoaiTin", "Ten");
            ViewBag.idTheLoai = new SelectList(db.TheLoais.ToList().OrderBy(n => n.TenTheLoai), "idTheLoai", "TenTheLoai");
            return View();
        }
        [HttpPost]
        [ValidateInput(false), AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DangTin(Tin tin, HttpPostedFileBase urlHinh, HttpPostedFileBase AnhHien)
        {
            ViewBag.idLoaiTin = new SelectList(db.LoaiTins.ToList().OrderBy(n => n.Ten), "idLoaiTin", "Ten");
            ViewBag.idTheLoai = new SelectList(db.TheLoais.ToList().OrderBy(n => n.TenTheLoai), "idTheLoai", "TenTheLoai");
            User admin = (User)Session["Admin"];

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
                //tin.idUser = 1 + "";
                tin.idUser = admin.idUser;
                tin.SoLanXem = 0;
                db.Tins.InsertOnSubmit(tin);
                db.SubmitChanges();
            }
            var dsEmail = db.DSMails.ToList();
            var tinNhan = "Click vào link để xem tin bạn nhé ^^."
                + Environment.NewLine +
                "http://congnghe24h.somee.com/TrangChu/CTTin/" + tin.idTin;
            foreach (var mail in dsEmail)
            {
                SendGmail(mail.Email, "Công Nghệ 24h - Tin mới : " + tin.TieuDe, tinNhan, null);
            }
            return RedirectToAction("AllTin");
        }
        #endregion

        #region QL The Loai
        public ActionResult QLTheLoai()
        {
            KiemTraQuyen();
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
        public ActionResult EditTheLoai(TheLoai theLoai, HttpPostedFileBase fileUpLoad, FormCollection collection)
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
                x.MatKhau == password && x.Active == true);
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

        #region hàm gửi email
        static public bool SendGmail(string to, string sub, string body, string attFile)
        {
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("ttcnm24@gmail.com");
            msg.To.Add(to);
            msg.Subject = sub;
            msg.Body = body;
            if (!string.IsNullOrEmpty(attFile) /*&& File.Exists(attFile)*/)
            {
                Attachment att = new Attachment(attFile);
                msg.Attachments.Add(att);
            }
            using (SmtpClient client = new SmtpClient())
            {
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("ttcnm24@gmail.com", "congnghemoi24");
                client.Host = "smtp.gmail.com";
                client.Port = 587;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                try
                {
                    client.Send(msg);
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }
        #endregion

        #region Câu chào tên
        public string CauChaoTen()
        {
            User admin = (User)Session["Admin"];
            return admin.HoTen;
        }
        #endregion

        #region Đổi mật khẩu nhân viên
        public ActionResult ChaneClick()
        {
            User admin = (User)Session["Admin"];
            return PartialView(db.Users.FirstOrDefault(x => x.idUser == admin.idUser));
        }
        [HttpGet]
        public ActionResult ChanePass(string id)
        {
            User user = db.Users.FirstOrDefault(x => x.idUser == id);
            if (user == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(user);
        }
        [HttpPost]
        public ActionResult ChanePass(string id, User user, FormCollection collec)
        {
            var matKhauMoi = collec["MatKhauMoi"];
            var xacNhan = collec["XacNhanMatKhau"];
            if (matKhauMoi.ToString() != xacNhan.ToString())
            {
                ViewBag.ThongBao = "Xác nhận password không chính xác .. !";
                return View();
            }
            var timNV = db.Users.FirstOrDefault(x => x.idUser == id);
            if (timNV != null)
            {
                timNV.MatKhau = matKhauMoi.ToString();
                UpdateModel(timNV);
                db.SubmitChanges();
            }
            return RedirectToAction("Index");
        }
        #endregion

        #region Kiểm soát quyền trước khi vào các trang
        void KiemTraQuyen()
        {
            User admin = (User)Session["Admin"];
            if (admin == null)
            {
                Response.Redirect("~/Admin/Login");
            }
            else
            {
                string url = Request.RawUrl;
                string tenTW = url.Substring(url.LastIndexOf('/') + 1);
                var listPQ = db.PhanQuyens.Where(x => x.MaVT == admin.MaVT).ToList();
                var diem = 0;
                foreach (var a in listPQ)
                {
                    if (a.TrangWeb.TenTW == tenTW && a.DuocPhep == true) diem = 1;
                }
                if (diem != 1) Response.Redirect("KoCoTrangNay");
            }
        }
        #endregion

       
        public ActionResult ThoatButton()
        {
             Session.Remove("Admin");
             return Redirect("~/Admin");
        }

    }
}