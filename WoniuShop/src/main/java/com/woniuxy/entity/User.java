package com.woniuxy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author jackpoit
 * @date: 2021/7/28 16:58
 * @description: 用户类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User  {
	private Integer id; // 用户编号
	private String username; // 用户名
	private String password; // 密码
	private String md5Code; //md5密码
	private String gender; // 性别
	private Date birthday; // 生日
	private String mobile; // 手机号码
	private String email; // 邮箱号
	private String realName; // 真实姓名
	private String idCard; // 身份证号码
	private String image; // 头像地址
	private Integer level;
	// 用户等级[0:普通等级 1:vip 2:vvvip ]
	private Integer uType; // 用户类型[0:用户 5:管理员 10:超级管理员]

	public User(String username, String md5Code, Integer uType) {
		this.username = username;
		this.md5Code = md5Code;
		this.uType = uType;
	}
	public User(String username, Integer uType) {
		this.username = username;
		this.uType = uType;
	}
}
