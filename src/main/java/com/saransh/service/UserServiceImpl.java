package com.saransh.service;

import java.util.ArrayList;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.saransh.dao.UserDao;
import com.saransh.entity.Users;
import com.saransh.entity.Roles;

/**
 * @author bytestree
 *
 */

@Service("userService")
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService, UserDetailsService {

	
	@Autowired
	UserDao userDao;

	/**
	 * Method to return UserDetails after successful login
	 * 
	 * @param username
	 * @return UserDetails object
	 */
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Users user = userDao.findById(username);

		if (user == null) {
			throw new UsernameNotFoundException("Invalid username or password");
		}
		return new org.springframework.security.core.userdetails.User(username, user.getPassword(), user.getEnabled(),
				true, true, !user.getLocked(), getAuthorities(user));

	}

	private List<GrantedAuthority> getAuthorities(Users user) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		for (Roles role : user.getRoleses()) {
			authorities.add(new SimpleGrantedAuthority(role.getName()));
		}
        if(authorities.size()<1) {
        	authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
        }
		return authorities;
	}

	@Transactional(readOnly = false)
	@Override
	public void saveLastLoginDate(String username) {
		Users user = userDao.findById(username);
		user.setLastLoginDate(new Date());
		userDao.save(user);

	}

	@Override
	public Users getUser(String username) {
		if(username==null) {
			AbstractAuthenticationToken auth = (AbstractAuthenticationToken)
	    		    SecurityContextHolder.getContext().getAuthentication();
	        User loginUser = (User) auth.getPrincipal();
		    username=loginUser.getUsername();
		}
		return userDao.findById(username);
	}

	@Transactional(readOnly = false)
	@Override
	public void saveUser(Users user) {
		userDao.save(user);

	}
	@Transactional(readOnly = false)
	@Override
	public void saveRole(Roles role) {
	    userDao.saveRole(role);
	}
	
	@Transactional(readOnly = false)
	@Override
	public Roles getRole(int id) {
	     return userDao.getRole(id);
	}
  }