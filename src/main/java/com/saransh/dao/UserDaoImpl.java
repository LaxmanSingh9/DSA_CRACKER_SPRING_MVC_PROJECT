package com.saransh.dao;

import java.io.Serializable;



import java.lang.reflect.ParameterizedType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saransh.entity.Question;
import com.saransh.entity.Roles;
import com.saransh.entity.Users;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
	@Autowired
	private SessionFactory sessionFactory;
	
    @Override
	public void save(Users username) {
		sessionFactory.getCurrentSession().saveOrUpdate(username);
	}

	@Override
	public Users findById(String username) {
		Session session = sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Users where username=:username");
		query.setParameter("username", username);
		return (Users)query.uniqueResult();
	}

	@Override
	public Roles getRole(int id) {
		 Session session = sessionFactory.getCurrentSession();
	     return session.get(Roles.class, id);
	}

	@Override
	public void saveRole(Roles role) {
		sessionFactory.getCurrentSession().saveOrUpdate(role);
	}
	


}
