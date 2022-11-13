package com.dsc.controller;

import java.util.*;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;



import com.dsc.utils.Util;
import java.util.*;


import com.dsc.service.QuestionService;
import com.dsc.utils.SortUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;


import com.dsc.entity.Roles;
import com.dsc.entity.Users;
import com.dsc.service.UserService;

@Controller
public class UserController {
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired 
	private UserService userService;
	
	
	@GetMapping("/login")
	public String loginPage() {
		return "login";
	}

	/*
	 *Method process the log out request  and mark the session invalid
	 */
	@GetMapping("/process_log_out")
	public String logOutPage(HttpServletRequest request){
	   HttpSession session = request.getSession();
	   session.invalidate();
	   return "redirect:/login?logout";
		
	}
	@GetMapping(value="/signup")
	public String signup(HttpServletRequest req, Model model) {
	    model.addAttribute("title", "Register - Smart Interview Preparation");
		model.addAttribute("user", new Users());
		return "signup";
	}	
	// handler for registering user
    @RequestMapping(value = "/do_register", method = RequestMethod.POST)
    public String registerUser(@Valid @ModelAttribute("user") Users user, Model model) {

			try {
				Users userCheck=userService.getUser(user.getUsername());
				if(userCheck!=null){
					return "redirect:/signup?exist";
				}
				else {
					Roles role=userService.getRole(1);
					if(role==null) {
						role=new Roles("ROLE_USER");
						userService.saveRole(role);
					}
					Set<Roles>set=new HashSet<>();
					set.add(role);
					user.setEnabled(true);
					user.setLocked(false);
					user.setFailedLogins(0);
				    user.setPassword(encoder.encode(user.getPassword()));
				    user.setLastLoginDate(new Date());
	                user.setRoleses(set);
				    this.userService.saveUser(user);
                    return "redirect:/login?login";
				}
				
			} catch (Exception e) {
				e.printStackTrace();
		        return "redirect:/signup?error";
			}

    }
	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public ModelAndView welcomePage() {

		ModelAndView model = new ModelAndView();
		model.addObject("message", "This is home page. It is accessible to all roles.");
		model.setViewName("applicatonHeader");
		return model;

	}
    @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDeniedPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("message", "You are not authorized to view this page.");
		model.setViewName("accessDenied");
		return model;
	}
	
	

}