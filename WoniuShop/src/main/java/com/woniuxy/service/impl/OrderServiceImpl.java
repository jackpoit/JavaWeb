package com.woniuxy.service.impl;

import com.woniuxy.entity.Order;
import com.woniuxy.entity.Product;
import com.woniuxy.mapper.OrderMapper;
import com.woniuxy.mapper.ProductMapper;
import com.woniuxy.service.OrderService;
import com.woniuxy.util.DBUtil;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Author: rua
 * @Date: 2021/8/4 15:16
 * @Description: 订单的业务逻辑层
 */
public class OrderServiceImpl implements OrderService {
	@Override
	public boolean addOrder(Order order) {
		if (order == null) {
			return false;
		}
		OrderMapper mapper = DBUtil.getMapper(OrderMapper.class);
		int row = mapper.add(order);
		DBUtil.close();
		return row > 0;
	}

	@Override
	public boolean commitOrder(int id) {
		OrderMapper orderMapper = DBUtil.getTransMapper(OrderMapper.class);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		ProductMapper productMapper = DBUtil.getTransMapper(ProductMapper.class);
		try {
			Order order = orderMapper.findById(id);
			int row = productMapper.setSaleAndStock(order.getPid(), order.getNum(), "true");
			if (row == 0) {
				throw new SQLException();
			}
			Product product = new Product();
			product.setId(order.getPid());
			List<Product> products = productMapper.findByCondition(product);
			if (products==null||products.get(0).getStock()<0)
				throw new SQLException();

			Order commitOrder = new Order();
			commitOrder.setId(id);
			Date now = new Date();
			commitOrder.setStartTime(sdf.format(now));
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

	@Override
	public List<Order> getOrder(Order order) {
		OrderMapper mapper = DBUtil.getMapper(OrderMapper.class);
		List<Order> list = mapper.findByCondition(order);
		DBUtil.close();
		return list.isEmpty()?null:list;
	}

	@Override
	public boolean updateOrder(Order order) {
		if (order==null)
			return false;
		OrderMapper mapper = DBUtil.getMapper(OrderMapper.class);
		int row = mapper.update(order);
		DBUtil.close();
		return row>0;
	}

	@Override
	public boolean doDelete(Integer... ids) {
		if (ids == null) {
			return false;
		}
		OrderMapper mapper = DBUtil.getMapper(OrderMapper.class);
		int row = mapper.deleteByIds(ids);
		DBUtil.close();
		return row > 0;
	}

	@Override
	public boolean deleteCommitedOrders(int id) {
		OrderMapper orderMapper = DBUtil.getTransMapper(OrderMapper.class);


		ProductMapper productMapper = DBUtil.getTransMapper(ProductMapper.class);
		try {
			Order order = orderMapper.findById(id);
			int row = productMapper.setSaleAndStock(order.getPid(), order.getNum(), "false");
			if (row == 0) {
				throw new SQLException();
			}

			row = orderMapper.deleteByIds(id);
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
