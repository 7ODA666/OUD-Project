using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OUD_Perfume_Project.Models.ViewModel
{
	public class ViewCartAndDeliveryInfoVM
	{
		public DeliveryInfoVM InfoContact { get; set; }

		public List<tblCartItem> UserCartItem { get; set; }
	}
}