using OUD_Perfume_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OUD_Perfume_Project.Repository.Home
{
	public class HomeRepository : IHomeRepository
	{
		private readonly OUD_PerfumeDB db = new OUD_PerfumeDB();

		public List<tblTestimonial> GetAllTestimonials()
		{
			List<tblTestimonial> testimonialList = db.tblTestimonials.OrderByDescending(t => t.ID).Take(4).ToList();

			return testimonialList;
		}

		public List<tblPerfume> GetSomeProduct()
		{
			List<tblPerfume> someProductList = db.tblPerfumes.OrderByDescending(sp => sp.PerfumeID).Take(8).ToList();
			return someProductList;
		}
	}
}