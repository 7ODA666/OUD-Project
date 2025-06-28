using OUD_Perfume_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OUD_Perfume_Project.Repository.Contacts
{
	public interface IContactRepository
	{
		List<tblTestimonial> GetAllTestimonials();

		void AddTestimonials(tblTestimonial testimonial);
	}
}
