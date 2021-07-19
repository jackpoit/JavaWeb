package com.woniuxy.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class Product implements Serializable {
	private static final long serialVersionUID =1l;
	private Integer id;
	private String pname;
	private String pinfo;
	private BigDecimal price;
	private Integer stock;
	private Integer sale;
	private String image;

	public Product(String pname, String pinfo, BigDecimal price, Integer stock, Integer sale, String image) {
		this.pname = pname;
		this.pinfo = pinfo;
		this.price = price;
		this.stock = stock;
		this.sale = sale;
		this.image = image;
	}

	public Product(Integer id, String pname, String pinfo, BigDecimal price, Integer stock, Integer sale, String image) {
		this.id = id;
		this.pname = pname;
		this.pinfo = pinfo;
		this.price = price;
		this.stock = stock;
		this.sale = sale;
		this.image = image;
	}

	public Product() {
	}

	@Override
	public String toString() {
		return "Product{" +
				"id=" + id +
				", pname='" + pname + '\'' +
				", pinfo='" + pinfo + '\'' +
				", price=" + price +
				", stock=" + stock +
				", sale=" + sale +
				", image='" + image + '\'' +
				'}';
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPinfo() {
		return pinfo;
	}

	public void setPinfo(String pinfo) {
		this.pinfo = pinfo;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public Integer getSale() {
		return sale;
	}

	public void setSale(Integer sale) {
		this.sale = sale;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}
