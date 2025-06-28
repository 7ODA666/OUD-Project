using OUD_Perfume_Project.Models;
using OUD_Perfume_Project.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace OUD_Perfume_Project.Repository.Carts
{
	public class CartRepository : ICartRepository
	{
		private readonly OUD_PerfumeDB db = new OUD_PerfumeDB();


		public void DeleteCartItem(int cartId)
		{
			tblCartItem cartItemDeleted = db.tblCartItems.Find(cartId);

			if (cartItemDeleted != null)
			{
				db.tblCartItems.Remove(cartItemDeleted);
				db.SaveChanges();
			}
		}

		public List<tblCartItem> GetAllCartItem(int userId)
		{
			List<tblCartItem> cartItem = db.tblCartItems.Where(ci => ci.UserID == userId).ToList();

			return cartItem;
		}

		public void IncrementQuantity(int cartId)
		{
			var item = db.tblCartItems.FirstOrDefault(c => c.CartItemID == cartId);
			if (item != null)
			{
				item.Quantity++;
				db.SaveChanges();
			}

		}

		public void DecrementQuantity(int cartId)
		{
			var item = db.tblCartItems.FirstOrDefault(c => c.CartItemID == cartId);
			if (item != null && item.Quantity > 1)
			{
				item.Quantity--;
				db.SaveChanges();
			}
		}

		public tblCartItem GetOneCartProductByUserID(int productId, int userId)
		{
			List<tblCartItem> userCartItem = GetAllCartItem(userId);
			tblCartItem product = userCartItem.FirstOrDefault(p => p.PerfumeID == productId);
			return product;
		}

		public void AddToCart(int productId, int Quantity, int userID)
		{
			tblCartItem product = GetOneCartProductByUserID(productId, userID);

			if (product != null)
			{
				product.Quantity += Quantity;
			}
			else
			{
				tblCartItem newCartItem = new tblCartItem();
				newCartItem.UserID = userID;
				newCartItem.PerfumeID = productId;
				newCartItem.Quantity = Quantity;

				db.tblCartItems.Add(newCartItem);
			}
			db.SaveChanges();

		}

		public int AddOrderAndReturnID(int userId, decimal totalPrice, DeliveryInfoVM info)
		{
			tblOrder newOrder = new tblOrder();
			newOrder.UserID = userId;
			newOrder.TotalPrice = totalPrice;
			newOrder.OrderDate = DateTime.Now;
			newOrder.PhoneNumber = info.PhoneContact;
			newOrder.Address = info.Address;

			db.tblOrders.Add(newOrder);
			db.SaveChanges();

			return newOrder.OrderID;
		}

		public void AddOrderDetails(int orderId, int productId, int quantity, decimal unitPrice)
		{
			tblOrderDetail newOrderDetails = new tblOrderDetail();
			newOrderDetails.OrderID = orderId;
			newOrderDetails.PerfumeID = productId;
			newOrderDetails.Quantity = quantity;
			newOrderDetails.UnitPrice = unitPrice;

			db.tblOrderDetails.Add(newOrderDetails);
			db.SaveChanges();
		}
	}
}