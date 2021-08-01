package com.woniuxy.service;

import com.woniuxy.entity.Product;

import java.util.List;

/**
 * @author: jackpoit
 * @date: 2021/7/31 17:17
 * @description:
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

	/**
	 * 根据关键词排序
	 * @param keyword 排序关键词
	 * @return 商品集合
	 */
	List<Product> getOrderByKeyword(String keyword ,String rule);

}
