package com.unmatched.vo;

import java.io.Serializable;
import java.util.Date;

public class UserRegister implements Serializable{

	private static final long serialVersionUID = -3434120349146071287L;
	private String username;
	private String password;
	private String agenPassword;
	private String email;
	private Integer age;
	private Integer gender;
	private Double height;
	private Double weight;
	private Date createdTime;

	public Double getHeight() {
		return height;
	}

	public UserRegister setHeight(Double height) {
		this.height = height;
		return this;
	}

	public Double getWeight() {
		return weight;
	}

	public UserRegister setWeight(Double weight) {
		this.weight = weight;
		return this;
	}

	public Integer getGender() {
		return gender;
	}

	public UserRegister setGender(Integer gender) {
		this.gender = gender;
		return this;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public UserRegister setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
		return this;
	}

	public Integer getAge() {
		return age;
	}

	public UserRegister setAge(Integer age) {
		this.age = age;
		return this;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAgenPassword() {
		return agenPassword;
	}
	public void setAgenPassword(String agenPassword) {
		this.agenPassword = agenPassword;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "UserRegister{" +
				"username='" + username + '\'' +
				", password='" + password + '\'' +
				", agenPassword='" + agenPassword + '\'' +
				", email='" + email + '\'' +
				", age=" + age +
				", gender=" + gender +
				", height=" + height +
				", weight=" + weight +
				", createdTime=" + createdTime +
				'}';
	}
}
