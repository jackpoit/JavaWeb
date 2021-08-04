package com.woniuxy.service.impl;

import com.woniuxy.entity.Order;
import com.woniuxy.mapper.OrderMapper;
import com.woniuxy.mapper.ProductMapper;
import com.woniuxy.service.OrderService;
import com.woniuxy.util.DBUtil;

import java.sql.SQLException;

/**
 * @Author: rua
 * @Date: 2021/8/4 15:16
 * @Description: 订单的业务逻辑层
 */
public class OrderServiceImpl implements OrderService {
	@Override
	public boolean addOrder(Order order) {
		if (order==null){
			return false;
		}
		OrderMapper mapper = DBUtil.getMapper(OrderMapper.class);
		int row = mapper.add(order);
		DBUtil.close();
		return row>0;
	}

	@Override
	public boolean commitOrder(int id) {
		OrderMapper orderMapper = DBUtil.getTransMapper(OrderMapper.class);

		ProductMapper productMapper = DBUtil.getTransMapper(ProductMapper.class);
		try {
			Order order = orderMapper.findById(id);
			int row = productMapper.setSaleAndStock(order.getPid(),order.getNum(),"true");
			if (row == 0) {
				throw new SQLException();
			}
			Order commitOrder = new Order();
			commitOrder.setId(id);
			commitOrder.setStatus(1);
			row = orderMapper.update(commitOrder);
			if (row == 0) {
				throw new SQLException();
			}
			DBUtil.commit();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			DBUtil.rollback();
		} finally {
			DBUtil.close();
		}
		return false;
	}
}
