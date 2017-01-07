using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAWEB2.Models;
using System.Text.RegularExpressions;

namespace DAWEB2.Controllers
{
    public class LienHeController : Controller
    {
        // GET: LienHe

        dbLinqDataContext db = new dbLinqDataContext();
        public ActionResult Index()
        {
            return View();
        }
        #region Ham kiem tra email
        static public bool EmailHopLe(string email)
        {
            string emailRegex = @"^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$";
            Regex re = new Regex(emailRegex);
            return re.IsMatch(email);
        }
        #endregion
        [HttpGet]
        public PartialViewResult lienhe3()
        {
            return PartialView();
        }
        [HttpPost]
        [ValidateInput(false)]
        public PartialViewResult lienhe3(Message me)
        {
            db.Messages.InsertOnSubmit(me);
            db.SubmitChanges();
            return PartialView();
        }

        [HttpGet]
        public PartialViewResult lienhe4()
        {
            return PartialView();
        }
        [HttpPost]
        [ValidateInput(false)]
        public PartialViewResult lienhe4(DSMail ds)
        {
            db.DSMails.InsertOnSubmit(ds);
            db.SubmitChanges();
            return PartialView();
        }

        [HttpGet]
        public PartialViewResult DangKyNhanTinMoi() // danh cho trang chu
        {
            return PartialView();
        }
        [HttpPost]
        [ValidateInput(false)]
        public PartialViewResult DangKyNhanTinMoi(DSMail ds, FormCollection collec)
        {
            var email = collec["Email"];
            if (EmailHopLe(email))
            {
                db.DSMails.InsertOnSubmit(ds);
                db.SubmitChanges();
            }
            else
            {
                
            }
            return PartialView();
        }
    }
}     
