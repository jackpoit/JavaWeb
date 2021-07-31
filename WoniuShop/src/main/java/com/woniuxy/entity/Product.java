package com.woniuxy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product implements Serializable {
	private static final long serialVersionUID =1l;
	private Integer id;
	private String pName;
	private String pInfo;
	private BigDecimal price;
	private Integer stock;
	private Integer sale;
	private String image;

	public Product(String pName, String pInfo, BigDecimal price, Integer stock, Integer sale, String image) {
		this.pName = pName;
		this.pInfo = pInfo;
		this.price = price;
		this.stock = stock;
		this.sale = sale;
		this.image = image;
	}






}
