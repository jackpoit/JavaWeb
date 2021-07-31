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
	private Integer id;
	private String username;
	private String mobile;
	private String area;
	private String location;
	private String postcode;
	private Integer defaultAdd;
	private Integer uid;
}
