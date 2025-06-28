using OUD_Perfume_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OUD_Perfume_Project.Repository.Products
{
	public class ProductRepository : IProductRepository
	{
		private readonly OUD_PerfumeDB db = new OUD_PerfumeDB();
		public List<tblPerfume> GetAllProducts()
		{
			List<tblPerfume> ProductList = db.tblPerfumes.ToList();
			return ProductList;
		}

		public tblPerfume GetOneProduct(int id)
		{
			tblPerfume product = db.tblPerfumes.Find(id);
			return product;
		}
	}
}