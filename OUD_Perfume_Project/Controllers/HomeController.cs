using OUD_Perfume_Project.Models;
using OUD_Perfume_Project.Models.ViewModel;
using OUD_Perfume_Project.Repository.Home;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OUD_Perfume_Project.Controllers
{
	public class HomeController : Controller
	{
		private readonly IHomeRepository _homeRepository;

		public HomeController()
		{
			_homeRepository = new HomeRepository();
		}


		public ActionResult Index()
		{
			ViewHomeDetailsVM homeDetails = new ViewHomeDetailsVM();

			homeDetails.Testimonials = _homeRepository.GetAllTestimonials();
			homeDetails.Products = _homeRepository.GetSomeProduct();

			return View(homeDetails);
		}

	}
}