using OUD_Perfume_Project.Models;
using OUD_Perfume_Project.Repository.Contacts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OUD_Perfume_Project.Controllers
{
    public class ContactController : Controller
    {
        private readonly IContactRepository _contactRepository;

        public ContactController()
        {
            _contactRepository = new ContactRepository();
        }

        // GET: 

        [HttpGet]
        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Add(tblTestimonial testimonial)
        {
            _contactRepository.AddTestimonials(testimonial);
            return View();
        }



    }
}