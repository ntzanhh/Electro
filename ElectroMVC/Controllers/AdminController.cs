﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ElectroMVC.Controllers
{
    [Authorize(Roles = "Administrator")]
    public class AdminController : Controller
	{

		public IActionResult Index()
		{
			return View();
		}
	}
}
