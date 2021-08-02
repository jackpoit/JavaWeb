package com.woniuxy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author: jackpoit
 * @date: 2021/7/31
 * @description:
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Address {
	private Integer id;        //自增id
	private Integer uid;       //用户id
	private String username;   //收货人姓名
	private String mobile;     //收货人手机号
	private String area;       //区域id
	private String location;   //具体地址
	private String postcode;   //邮政编码
	private Integer isDefault; //1:默认地址

	public Address(Integer uid, Integer isDefault) {
		this.uid = uid;
		this.isDefault = isDefault;
	}
}
