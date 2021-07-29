package com.woniuxy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User  {
	private Integer id;
	private String username;
	private String password;
	private String phone;
	private String email;
	private String imagePath;
	private String userLevel;

	public User(String username, String password, String phone, String email) {
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.email = email;
	}

	public User(Integer id, String username, String password, String phone, String email) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.email = email;
	}
}
