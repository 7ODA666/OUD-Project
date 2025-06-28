using OUD_Perfume_Project.Models;
using OUD_Perfume_Project.Repository.Encroption;
using OUD_Perfume_Project.Repository.Encryption;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OUD_Perfume_Project.Repository.UserAccount
{
	
	public class UserAccountRepository : IUserAccountRepository
	{
		private readonly IEncryptionRepository _encryptionRepository = new EncryptionRepository();
		private readonly OUD_PerfumeDB db = new OUD_PerfumeDB();
		public void AddUser(tblUser user)
		{
			user.Password = _encryptionRepository.Encryption(user.Password);
			db.tblUsers.Add(user);
			db.SaveChanges();
		}

		public bool UserExist(string email)
		{

			tblUser user = db.tblUsers.FirstOrDefault(u => u.Email == email);
			if (user == null)
				return false;
			else
				return true;

		}

		public tblUser GetUser(string email, string password)
		{
			password = _encryptionRepository.Encryption(password);
			tblUser user = db.tblUsers.FirstOrDefault(u => u.Email == email && u.Password == password);
			return user;
		}

		public tblUser GetUser(int id)
		{
			tblUser user = db.tblUsers.Find(id);
			user.Password = _encryptionRepository.Decryption(user.Password);
			return user;
		}

		public List<tblOrder> GetOrder(int id)
		{
			List<tblOrder> order = db.tblOrders.Where(o => o.UserID == id).ToList();

			return order;
		}

		
	}
}