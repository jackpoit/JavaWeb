package com.woniuxy.service;

import com.woniuxy.entity.Order;

import java.util.List;

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

	/**
	 * 获得订单集合
	 * @param order 订单对象
	 * @return 订单集合
	 */
	List<Order> getOrder(Order order);

	/**
	 * 更新订单对象
	 * @param order 订单对象
	 * @return true成功
	 */
	boolean updateOrder(Order order);

	/**
	 * 删除
	 * @param ids 要删除的id数组
	 * @return 成功-->true
	 */
	boolean doDelete(Integer... ids);

	/**
	 * 根据id提交订单
	 * @param id 订单id
	 * @return true成功
	 */
	boolean deleteCommitedOrders(int id);
}
