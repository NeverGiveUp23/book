package com.example.book.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.book.models.LoginUser;
import com.example.book.models.User;
import com.example.book.service.UserService;

@Controller
public class LoginController {
//	bringing in UserService file
	@Autowired
	private UserService userServ;
	
	
	@GetMapping("/")
	public String index() {
		return "redirect:/home";
	}
	
//	login form and reg form
	@GetMapping("/home")
	public String loginReg(Model model) {
//		Binding
//		creating a new user and passing in the model Attribute name into the login jsp file
//		same goes with the newLogin name going into the login form on the same page
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "login.jsp";
	}
	
//	========== POST MAPPING ==============
	
	@PostMapping("/register")
//	bringing in newUser into the form to be processed
	public String login(@Valid @ModelAttribute("newUser") User newUser,
			BindingResult result, Model model, HttpSession session) {
		
//		using session to save the user that  logged in
//		passing in register()method from the service file
		User registeredUser = userServ.register(newUser, result);
		
//		if any errors
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "login.jsp";
		}
//		assigning session to that specific user, also getting there userName or name, etc... 
//		depending on what path is stored in the DB
		session.setAttribute("userId", registeredUser.getId());
		session.setAttribute("userName", registeredUser.getUserName());
		
		return "redirect:/home";
		
	}
		
		@PostMapping("/login")
		public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,
				BindingResult result, Model model, HttpSession session) {
//			passing in the login method from the user service
			User LoginUser = userServ.login(newLogin, result);
			
			if(result.hasErrors()) {
				model.addAttribute("newUser", new User());
				return "login.jsp";
			}
//			setting session with that user once they're logged in, it gets passed throughout pages
			session.setAttribute("userId", LoginUser.getId());
			session.setAttribute("userName", LoginUser.getUserName());
			
			return "redirect:/dashboard";
		
		
	}
		
		
//		logout method
		@GetMapping("/logout")
		public String logout(HttpSession session) {
//			invalidate is a built in method
			session.invalidate();
			return "redirect:/";
		}


}
