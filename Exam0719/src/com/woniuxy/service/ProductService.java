package com.woniuxy.service;

import com.woniuxy.entity.Product;

import java.util.List;

public interface ProductService {
	/**
	 *
	 * @param product 产品
	 * @return 是否添加成功
	 */
	boolean addProduct(Product product);

	/**
	 *
	 * @param id 产品id
	 * @return 相应id的产品对象
	 */
	Product selectOneById(int id);

	/**
	 * 查询所有产品对象
	 * @return 产品对象集合
	 */
	List<Product> selectAll();

}
