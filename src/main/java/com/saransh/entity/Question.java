package com.saransh.entity;
import java.util.HashSet;

import java.util.Set;

import javax.persistence.*;

import javax.validation.constraints.NotNull;
/*
 * This class encapsulate dsa problem
 */
@Entity
@Table(name="question")
public class Question {
   
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Id
   @Column(name = "id")
   private int id;
   
   @Column(name = "name")
   @NotNull(message = "is required")
   private String name;
   
   @Column(name = "diff")
   @NotNull(message = "is required")
   private String diff;
   
   @Column(name = "tag")
   @NotNull(message = "is required")
   private String tag;
   
   @Column(name = "sheet_name")
   @NotNull(message = "is required")
   private String sheetName;
   
   
   @Column(name = "link1")
   private String link1;
   
   @Column(name = "link2")
   private String link2;
   
    @ManyToMany
	@JoinTable(
	      name = "solved_ques",
		  joinColumns = @JoinColumn(name = "id"),
		   inverseJoinColumns = @JoinColumn(name = "user_id")
	)
   private Set<Users> useres = new HashSet<Users>();
    
   
   public Set<Users> getUsers() {
	  return useres;
   }
   public void setUsers(Set<Users> useres) {
	 this.useres = useres;
   }
   
   public int getId() {
	 return id;
   }
   public void setId(int id) {
	this.id = id;
   } 
   public String getName() {
	return name; 
   }
   public void setName(String name) {
	this.name = name;
   }
   public String getDiff() {
	 return diff;
  }
  public void setDiff(String diff) {
	this.diff = diff;
  }
  public String getTag() {
	return tag;
  }
  public void setTag(String tag) {
	this.tag = tag;
  }
  public String getLink1() {
	return link1;
  }
  public void setLink1(String link1) {
	this.link1 = link1;
  }
  public String getLink2() {
	return link2;
  }
  public void setLink2(String link2) {
	this.link2 = link2;
  }
  public String getSheetName() {
		return sheetName;
	}
	public void setSheetName(String sheetName) {
		this.sheetName = sheetName;
	}
  @Override
  public String toString() {
		return "Question [id=" + id + ", name=" + name + ", diff=" + diff + ", tag=" + tag + ", link1=" + link1
				+ ", link2=" + link2 + "]";
	}
}