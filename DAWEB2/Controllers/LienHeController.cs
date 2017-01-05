using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAWEB2.Models;

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

    }
}