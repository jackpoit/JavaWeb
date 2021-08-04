package com.woniuxy.mapper;

import com.woniuxy.entity.Order;

/**
 * @Author: rua
 * @Date: 2021/8/4 14:49
 * @Description:
 */
public interface OrderMapper {

	/**
	 * 添加订单
	 * @param order 订单信息对象
	 * @return 受影响行数
	 */
	int add(Order order);

	/**
	 *  根据id查询订单
	 * @param id 订单id
	 * @return order对象
	 */
	Order findById(int id);

	/**
	 *  更新
	 * @param order 订单
	 * @return 受影响行数
	 */
	int update(Order order);
}
