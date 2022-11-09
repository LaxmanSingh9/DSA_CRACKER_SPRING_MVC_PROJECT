package com.dsc.handler;

import java.io.IOException;





import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.util.UriComponentsBuilder;
import org.springframework.security.core.context.SecurityContextHolder;
import javax.servlet.http.HttpSession;
import org.springframework.security.web.util.UrlUtils;
import org.springframework.security.core.userdetails.UserCache;
import org.springframework.stereotype.Component;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import com.dsc.utils.Util;
import com.dsc.entity.Users;
import com.dsc.service.UserService;
@Component("customLogOutHandler")
class  CustomLogOutHandler extends SimpleUrlLogoutSuccessHandler implements LogoutSuccessHandler{
	  @Autowired
  	  UserService userService;
      private final static String REDIRECTION_PATH = "/login?logout";

	  @Override
	  public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		  User loginUser = (User) authentication.getPrincipal();
		  Users user = userService.getUser(loginUser.getUsername());
		  user.setEnabled(false);
		  user.setFailedLogins(0);
		  userService.saveUser(user);
		  response.sendRedirect(REDIRECTION_PATH);
		  super.onLogoutSuccess(request, response, authentication);
	    
	  }
}