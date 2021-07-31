package com.woniuxy.service;

import com.woniuxy.entity.Product;

import java.util.List;

/**
 * @Author: rua
 * @Date: 2021/7/31 17:17
 * @Description:
 */
public interface ProductService {

	/**
	 * 获取所有商品集合
	 * @return 商品集合
	 */
	List<Product> getAll();

	/**
	 * 首页商品获取
	 * @return 商品集合
	 */
	List<Product> findByPage(int currentPage);

}
