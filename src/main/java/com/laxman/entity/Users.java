package com.saransh.entity;

import java.io.Serializable;

import java.util.*;
import javax.persistence.*;
import javax.validation.constraints.NotNull;


@Entity
@Table(name="users")
public class Users implements Serializable {

	private static final long serialVersionUID = 1948638898199176136L;
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	@Column(name = "user_id")
	private int user_id;
	
	@Column(name = "username", unique = true, nullable = false, length = 100)
	private String username;

	@Column(name = "password", nullable = false, length = 100)
	private String password;

	@Column(name = "failed_logins")
	private Integer failedLogins;

	@Column(name = "enabled")
	private Boolean enabled;

	@Column(name = "locked")
	private Boolean locked;

	@Column(name = "last_login_date", length = 23)
	private Date lastLoginDate;

	@ManyToMany
	@JoinTable(
	      name = "authorities",
		  joinColumns = @JoinColumn(name = "user_id"),
		   inverseJoinColumns = @JoinColumn(name = "role_id")
	)
	private Set<Roles> roleses = new HashSet<Roles>();
     
	@ManyToMany(mappedBy = "useres" , fetch = FetchType.EAGER)
    private Set<Question> ques = new HashSet<Question>();	
	
	
	
	
	
	public Set<Question> getQues() {
		return ques;
	}

	public void setQues(Set<Question> ques) {
		this.ques = ques;
	}

	public Users() {
	}

	public Users(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public Users(String username, String password, Integer failedLogins,
			Boolean enabled, Boolean locked, Date lastLoginDate,
			Set<Roles> roleses) {
		this.username = username;
		this.password = password;
		this.failedLogins = failedLogins;
		this.enabled = enabled;
		this.locked = locked;
		this.lastLoginDate = lastLoginDate;
		this.roleses = roleses;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getFailedLogins() {
		return this.failedLogins;
	}

	public void setFailedLogins(Integer failedLogins) {
		this.failedLogins = failedLogins;
	}

	public Boolean getEnabled() {
		return this.enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public Boolean getLocked() {
		return this.locked;
	}

	public void setLocked(Boolean locked) {
		this.locked = locked;
	}

	public Date getLastLoginDate() {
		return this.lastLoginDate;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public Set<Roles> getRoleses() {
		return this.roleses;
	}

	public void setRoleses(Set<Roles> roleses) {
		this.roleses = roleses;
	}
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
     
	

}