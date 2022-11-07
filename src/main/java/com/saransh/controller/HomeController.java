package com.saransh.controller;

import java.util.*;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;



import com.saransh.utils.Util;
import java.util.*;


import com.saransh.service.QuestionService;
import com.saransh.utils.SortUtils;
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


import com.saransh.entity.Roles;
import com.saransh.entity.Users;
import com.saransh.service.UserService;

@Controller
public class HomeController {
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired 
	private UserService userService;
	
	
	@GetMapping("/login")
	public String loginPage() {
		return "login";
	}
	@RequestMapping(value="/signup")
	public String signup(Model model) {
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
					model.addAttribute("user", user);
					model.addAttribute("msgClass","alert alert-warning");
					model.addAttribute("message","User Name already exist , please enter another User Name");
				}
				else if(user.getPassword().trim().length()<1) {
					model.addAttribute("user", user);
					model.addAttribute("msgClass","alert alert-warning");
					model.addAttribute("message","Please  enter an valid password");
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
                    model.addAttribute("user", new Users());
                    model.addAttribute("msgClass","alert alert-success");
                    model.addAttribute("message","Successful sign up , please sign in to proceed further");
				}
				return "signup";
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("user", user);
				model.addAttribute("msgClass","alert alert-danger");
				model.addAttribute("message","Something went wrong"+ e.getMessage()+ "please try after some time");
				return "signup";
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