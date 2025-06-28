using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OUD_Perfume_Project.Repository.Encroption
{
	public interface IEncryptionRepository
	{
	    string Encryption(string password);

	    string Decryption(string password);

	}
}
