using System.Web;
using System.Web.Mvc;

namespace OUD_Perfume_Project
{
	public class FilterConfig
	{
		public static void RegisterGlobalFilters(GlobalFilterCollection filters)
		{
			filters.Add(new HandleErrorAttribute());
		}
	}
}
