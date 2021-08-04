package com.woniuxy.mapper;

import com.woniuxy.entity.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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

	/**
	 * 根据条件查询
	 * @param order 包含信息的order对象
	 * @return order集合
	 */
	List<Order> findByCondition(Order order);

	/**
	 * 删除
	 * @param ids id集合
	 * @return 受影响行数
	 */
	int deleteByIds(@Param("ids") Integer... ids);
}
