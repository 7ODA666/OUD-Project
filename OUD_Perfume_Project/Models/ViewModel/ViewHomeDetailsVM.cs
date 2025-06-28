using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OUD_Perfume_Project.Models.ViewModel
{
	public class ViewHomeDetailsVM
	{
		public List<tblTestimonial> Testimonials { get; set; }

		public List<tblPerfume> Products { get; set; }
	}
}