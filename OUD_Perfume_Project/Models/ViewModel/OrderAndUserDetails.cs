using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OUD_Perfume_Project.Models.ViewModel
{
	public class OrderAndUserDetails
	{
		public List<tblOrder> orders { set; get; }

		public tblUser user { set; get; }

	}
}