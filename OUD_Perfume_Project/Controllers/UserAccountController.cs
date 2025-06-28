using OUD_Perfume_Project.Models;
using OUD_Perfume_Project.Models.ViewModel;
using OUD_Perfume_Project.Repository.Encroption;
using OUD_Perfume_Project.Repository.Encryption;
using OUD_Perfume_Project.Repository.UserAccount;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Razor.Generator;

namespace OUD_Perfume_Project.Controllers
{
	public class UserAccountController : Controller
	{
		// GET: UserAccount
		private readonly IUserAccountRepository _userAccountRepository;
		private readonly IEncryptionRepository _encryptionRepository;

		public UserAccountController()
		{
			_userAccountRepository = new UserAccountRepository();
			_encryptionRepository = new EncryptionRepository();
		}

		public ActionResult Index()
		{
			return View();
		}

		public ActionResult UserProfile()
		{
			OrderAndUserDetails  orderUser = new OrderAndUserDetails();
			orderUser.orders = _userAccountRepository.GetOrder((int)Session["UserID"]);
			orderUser.user = _userAccountRepository.GetUser((int)Session["UserID"]);

			return View(orderUser);
		}

		[HttpGet]
		public ActionResult Register()
		{
			return View();
		}

		[HttpPost]
		public ActionResult Register(UserTemp user)
		{
			if (!ModelState.IsValid)
			{
				return View(user);
			}


			bool UserExist = _userAccountRepository.UserExist(user.Email);
			if (!UserExist)
			{
				tblUser NewUser = new tblUser();

				NewUser.FirstName = user.FirstName;
				NewUser.LastName = user.LastName;
				NewUser.Email = user.Email;
				NewUser.Password = user.Password;

				_userAccountRepository.AddUser(NewUser);

				NewUser.Password = _encryptionRepository.Decryption(NewUser.Password);
				tblUser LoggedUser = _userAccountRepository.GetUser(NewUser.Email, NewUser.Password);

				Session["UserID"] = LoggedUser.UserID;
				Session["UserName"] = LoggedUser.FirstName;

				return RedirectToAction("Index", "Home");
			}


			ModelState.AddModelError("", "This email is already registered.");
			return View(user);
		}

		[HttpGet]
		public ActionResult Login()
		{
			return View();
		}

		[HttpPost]
		public ActionResult Login(LoginUserVM user)
		{
			if (!ModelState.IsValid)
			{
				return View(user);
			}

			tblUser LogedUser = _userAccountRepository.GetUser(user.Email, user.Password);

			if (LogedUser != null)
			{
				Session["UserID"] = LogedUser.UserID;
				Session["UserName"] = LogedUser.FirstName;

				return RedirectToAction("Index", "Home");
			}

			ModelState.AddModelError("", "Invalid email or password.");
			return View(user);
		}

		public ActionResult Logout()
		{
			Session.Clear();
			return RedirectToAction("Index", "Home");
		}
	}
}