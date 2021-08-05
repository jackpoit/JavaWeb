package com.woniuxy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author jackpoit
 * @date: 2021/7/28 16:58
 * @description: 商品类
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private Integer id;
	private String pname;
	private String pinfo;
	private BigDecimal price;
	private Integer stock;
	private Integer sale;
	private String image;
	private Integer ptype; // 商品类别0:刀 1:枪 2:手套 3:杂项 4:印花
	private Integer status; //商品状态 0:上架 1:下架

	private List<ProDetails> details;

	public Product(String pName, String pInfo, BigDecimal price, Integer stock, Integer sale, String image) {
		this.pname = pName;
		this.pinfo = pInfo;
		this.price = price;
		this.stock = stock;
		this.sale = sale;
		this.image = image;
	}



}
