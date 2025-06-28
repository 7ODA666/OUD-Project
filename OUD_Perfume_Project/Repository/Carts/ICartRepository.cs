using OUD_Perfume_Project.Models;
using OUD_Perfume_Project.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OUD_Perfume_Project.Repository.Carts
{
	public interface ICartRepository
	{
		List<tblCartItem> GetAllCartItem(int userId);

		tblCartItem GetOneCartProductByUserID(int productId,int userId);

		void DeleteCartItem(int cartId);

		void IncrementQuantity(int cartId);

		void DecrementQuantity(int cartId);

		void AddToCart(int productId, int Quantity, int userID);

		int AddOrderAndReturnID(int userId, decimal totalPrice, DeliveryInfoVM info);

		void AddOrderDetails(int orderId, int productId, int quantity, decimal unitPrice);
	}
}
