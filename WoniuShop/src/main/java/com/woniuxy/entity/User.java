package com.woniuxy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author jackpoit
 * 用户类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User  {
	private Integer id; // 用户编号
	private String username; // 用户名
	private String password; // 密码
	private String gender; // 性别
	private Date birthday; // 生日
	private String mobile; // 手机号码
	private String email; // 邮箱号
	private String realName; // 真实姓名
	private String idCard; // 身份证号码
	private String image; // 头像地址
	private Integer level; // 用户等级【0:普通等级】
	private Integer uType; // 用户类型

}
