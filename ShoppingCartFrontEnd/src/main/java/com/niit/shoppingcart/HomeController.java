package com.niit.shoppingcart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	
/*	@RequestMapping("/")
	public String ShoppingCartHomePage()
	{
		return"Home";
	}
*/
	
	
	
	@RequestMapping("/")
	public ModelAndView home(){
		ModelAndView mv=new ModelAndView("Home");
		mv.addObject("message", "Thank you for visiting this URL");
		return mv;
	}
	@RequestMapping("/Login")
	public ModelAndView Login()
	{
		ModelAndView mv=new ModelAndView("Login");
		mv.addObject("UserClickedLoginHere", "true");

		return mv;


	}
	
	@RequestMapping("/Register")
	public ModelAndView Register(){
		ModelAndView mv=new ModelAndView("Registration");
		mv.addObject("UserClickedRegisterHere", "true");


		return mv;

		
	}
	
	
	}
