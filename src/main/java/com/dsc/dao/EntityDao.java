package com.saransh.dao;

import java.io.Serializable;

public interface EntityDao<E> {

	E findById(Serializable id);

	void save(E entity);
}