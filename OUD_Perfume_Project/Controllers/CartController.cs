using OUD_Perfume_Project.Models;
using OUD_Perfume_Project.Models.ViewModel;
using OUD_Perfume_Project.Repository.Carts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OUD_Perfume_Project.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart List of The CartItem
        private readonly ICartRepository _cartRepository;

        public CartController()
        {
            _cartRepository = new CartRepository();
        }

        // Show user cart item
        [HttpGet]
        public ActionResult Index()
        {

            if (Session["UserID"] == null)
            {
                return RedirectToAction("Login", "UserAccount");
            }


            ViewCartAndDeliveryInfoVM cartDetails = new ViewCartAndDeliveryInfoVM
            {
                UserCartItem = new List<tblCartItem>(),

               InfoContact = new DeliveryInfoVM()

            };

            cartDetails.UserCartItem = _cartRepository.GetAllCartItem((int)Session["UserID"]);

			Session["TotalPrice"] = 0;

            return View(cartDetails);
        }

		// Show user cart item summary in all sections
		public ActionResult CartSummary()
		{
            List<tblCartItem> cartItems = _cartRepository.GetAllCartItem((int)Session["UserID"]);

			Session["TotalPrice"] = 0;

			return PartialView("_CartSummary",cartItems);
		}

		public ActionResult GetCartCount()
		{
       
			var cartItems = _cartRepository.GetAllCartItem((int)Session["UserID"]);

			int totalQuantity = cartItems.Sum(item => (int)item.Quantity);

			return PartialView("_CartHeader", totalQuantity);
		}

		// delete one cart item 
		public ActionResult Delete(int id)
        {
            _cartRepository.DeleteCartItem(id);

            return RedirectToAction("Index");
        }
		
        // increment quantity of product
		public ActionResult Increment(int id)
        {
            _cartRepository.IncrementQuantity(id);
            return RedirectToAction("Index");
        }

		// decrement quantity of product
		public ActionResult Decrement(int id)
        {
            _cartRepository.DecrementQuantity(id);
            return RedirectToAction("Index");
        }

        // User Add to Cart in Product Section
        [HttpPost]
        public ActionResult AddToCart(int productId,int quantity)
        {
            if (Session["UserID"] == null)
            {
				return Json(new { success = false, redirectUrl = Url.Action("Login", "UserAccount") });
			}

            _cartRepository.AddToCart(productId, quantity,(int)Session["UserID"]);


            return Json(new { success = true });
        }
    

        [HttpPost]
        public ActionResult Checkout(ViewCartAndDeliveryInfoVM Info)
        {
           
            // Get CartItme by userid
            
            List<tblCartItem>userCartItem = _cartRepository.GetAllCartItem((int)Session["UserID"]);
            if (userCartItem.Count == 0)
            {
                return RedirectToAction("Index", "Product");
            }

			// Add Order and ReturnID ( userid , totalprice , deliveryinfo )
			int orderId = _cartRepository.AddOrderAndReturnID((int)Session["UserID"], (decimal)Session["TotalPrice"], Info.InfoContact);

			//  foreach ( AddOrderDetails , Delete CartItem )
			foreach (tblCartItem item in userCartItem)
            {
                _cartRepository.AddOrderDetails(orderId,(int) item.PerfumeID,(int) item.Quantity,(decimal) item.tblPerfume.Price);

                _cartRepository.DeleteCartItem(item.CartItemID);
            }


            return RedirectToAction("Index", "Home");
        }

    }
}