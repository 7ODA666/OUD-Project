using OUD_Perfume_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OUD_Perfume_Project.Repository.Contacts
{
	public class ContactRepository : IContactRepository
	{
		private readonly OUD_PerfumeDB db = new OUD_PerfumeDB();

		public void AddTestimonials(tblTestimonial testimonial)
		{
			db.tblTestimonials.Add(testimonial);
			db.SaveChanges();
		}

		public List<tblTestimonial> GetAllTestimonials()
		{
			List<tblTestimonial> TestimonialList = db.tblTestimonials.ToList();
			return TestimonialList;
		}
	}
}