using OUD_Perfume_Project.Models;
using OUD_Perfume_Project.Repository.Products;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Web;
using System.Web.Mvc;

namespace OUD_Perfume_Project.Controllers
{
	public class ProductController : Controller
	{
		// GET: List of Products 
		private readonly IProductRepository _productRepository;

		private OUD_PerfumeDB db = new OUD_PerfumeDB();

		public ProductController()
		{
			_productRepository = new ProductRepository();
		}

		public ActionResult Index()
		{
			var ProductList = _productRepository.GetAllProducts();

			return View(ProductList);
		}

		public ActionResult ProductDetails(int id)
		{
			tblPerfume product = _productRepository.GetOneProduct(id);
			return View(product);
		}

	}
}