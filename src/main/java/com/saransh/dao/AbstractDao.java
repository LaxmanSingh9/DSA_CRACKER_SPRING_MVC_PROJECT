package com.saransh.dao;

import java.io.Serializable;



import java.lang.reflect.ParameterizedType;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@SuppressWarnings("unchecked")
public abstract class AbstractDao<E> implements EntityDao<E> {

	private final Class<E> entityClass;
	@Autowired
	private SessionFactory sessionFactory;

	public AbstractDao() {
		this.entityClass = (Class<E>) ((ParameterizedType) this.getClass().getGenericSuperclass())
				.getActualTypeArguments()[0];
	}
	
    @Override
	public E findById(final Serializable id) {
	    return (E) sessionFactory.getCurrentSession().get(entityClass, id);
	}

	@Override
	public void save(E entity) {
		sessionFactory.getCurrentSession().saveOrUpdate(entity);
	}
	
   
}