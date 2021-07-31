package com.woniuxy.mapper;

import com.woniuxy.entity.Product;
import com.woniuxy.entity.User;

import java.util.List;

/**
 * @author: jackpoit
 * @date: 2021/7/31 16:58
 * @description: 商品持久层接口
 */
public interface ProductMapper {

	/**
	 * 根据特定条件查询商品集合(user为null查所有)
	 * @param product 包含要查询信息的员工对象
	 * @return 查询到的员工集合
	 */
	List<Product> findByCondition(Product product);
}
