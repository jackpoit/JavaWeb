package com.woniuxy.web.servlet;

import java.util.Objects;

public class User {
	private String username;
	private String password;
	private String phone;
	private String email;

	public User(String username, String password, String phone, String email) {
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.email = email;
	}

	public User() {
	}

	@Override
	public String toString() {
		return "User{" +
				"username='" + username + '\'' +
				", password='" + password + '\'' +
				", phone='" + phone + '\'' +
				", email='" + email + '\'' +
				'}';
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (!(o instanceof User)) return false;
		User user = (User) o;
		return Objects.equals(username, user.username) &&
				Objects.equals(password, user.password) &&
				Objects.equals(phone, user.phone) &&
				Objects.equals(email, user.email);
	}

	@Override
	public int hashCode() {
		return Objects.hash(username, password, phone, email);
	}
}
