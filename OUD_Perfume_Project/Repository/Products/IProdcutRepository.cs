using OUD_Perfume_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OUD_Perfume_Project.Repository.Products
{
	public interface IProductRepository 
	{
		List<tblPerfume> GetAllProducts();

		tblPerfume GetOneProduct(int id);


	}
}
