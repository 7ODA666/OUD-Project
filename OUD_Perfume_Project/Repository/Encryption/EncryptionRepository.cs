using OUD_Perfume_Project.Repository.Encroption;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace OUD_Perfume_Project.Repository.Encryption
{
	public class EncryptionRepository : IEncryptionRepository
	{
		private string OriginalChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~^_{}[]|#$@ ";
		private string AltChar = " CU5fGVXMF9I0vh_zuOTR#]@kp[$~wA^N63laB2m|SoxrJ74}PdqEs8WiZgLjYtbDQeKyc{nH1";

		public string Encryption(string password)
		{
			var sb = new StringBuilder();
			foreach (char c in password)
			{
				var Index = OriginalChar.IndexOf(c);
				sb.Append(AltChar[Index]);
			}

			return sb.ToString();
		}

		public string Decryption(string password)
		{
			var sb = new StringBuilder();
			foreach (char c in password)
			{
				var Index = AltChar.IndexOf(c);
				sb.Append(OriginalChar[Index]);
			}


			return sb.ToString();
		}
	}
}