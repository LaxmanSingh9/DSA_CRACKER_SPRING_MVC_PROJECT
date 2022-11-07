package com.saransh.entity;

import java.io.Serializable;
import java.util.*;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="roles")
public class Roles implements Serializable {

	private static final long serialVersionUID = 8215940655966357715L;
	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
    @Column(name = "role_id")
	private int role_id;

	@Column(name = "name", nullable = false, length = 50)
	private String name;

	@ManyToMany(mappedBy = "roleses")
    private Set<Users> users = new HashSet<Users>();

	public Roles() {
	}

	public Roles(String name) {
		this.name = name;
	}

	public Roles(int role_id, String name, Set<Users> users) {
		this.role_id = role_id;
		this.name = name;
		this.users = users;
	}

	public int getId() {
		return this.role_id;
	}

	public void setId(int role_id) {
		this.role_id = role_id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Users> getUsers() {
		return this.users;
	}

	public void setUsers(Set<Users> users) {
		this.users = users;
	}

}