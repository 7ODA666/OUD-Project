using OUD_Perfume_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OUD_Perfume_Project.Repository.UserAccount
{
	public interface IUserAccountRepository
	{
		void AddUser(tblUser user);

		bool UserExist(string email);
		tblUser GetUser(string email,string password);

		tblUser GetUser(int id);

		List<tblOrder> GetOrder(int id);

	}
}
