package com.woniuxy.service;

import com.woniuxy.entity.Order;

/**
 * @Author: rua
 * @Date: 2021/8/4 15:15
 * @Description:
 */
public interface OrderService {

	/**
	 * 添加订单
	 * @param order 订单对象
	 * @return true成功
	 */
	boolean addOrder(Order order);

	/**
	 * 根据id提交订单
	 * @param id 订单id
	 * @return true成功
	 */
	boolean commitOrder(int id);
}
