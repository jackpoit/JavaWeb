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

	/**
	 * 根据多个条件查询
	 * @param ono 订单号 /null ''查所有名称的订单
	 * @param status 订单状态 null查所有状态
	 * @param pids 商品id集合  null查所有
	 * @param uid 用户id
	 * @return 订单对象集合
	 */
	List<Order> findBySome(@Param("ono")String ono,@Param("status") Integer status,@Param("pids") Integer[] pids,@Param("uid") Integer uid);


	/**
	 * 根据id查
	 * @param ids id集合
	 * @return 订单对象集合
	 */
	List<Order> findByIds(@Param("ids") Integer[] ids);

	/**
	 * 更新订单对象
	 * @param ids 订单编号集合
	 * @return 受影响行数
	 */
	int confirmOrderByIds(@Param("ids") Integer[] ids);
}
