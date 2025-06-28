using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace OUD_Perfume_Project.Models
{
	public class UserTemp
	{
		[Required(ErrorMessage = "First Name is required")]
		public string FirstName { get; set; }

		[Required(ErrorMessage ="Last Name is required")]
		public string LastName { get; set; }

		[Required(ErrorMessage = "Email is required")]
		[EmailAddress(ErrorMessage = "Invalid email format")]
		public string Email { get; set; }

		[Required(ErrorMessage = "Password is required")]
		[MinLength(6, ErrorMessage = "Password must be at least 6 characters")]
		public string Password { get; set; }


		[Required]
		[DataType(DataType.Password)]
		[Compare("Password", ErrorMessage = "Passwords do not match.")]
		public string ConfirmPassword { get; set; }
	}
}