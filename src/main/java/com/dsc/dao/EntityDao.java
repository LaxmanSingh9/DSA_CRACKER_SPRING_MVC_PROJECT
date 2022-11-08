package com.dsc.dao;

import java.io.Serializable;

public interface EntityDao<E> {

	E findById(Serializable id);

	void save(E entity);
}