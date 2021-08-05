package com.woniuxy.service.impl;

import com.woniuxy.entity.Order;
import com.woniuxy.mapper.OrderMapper;
import com.woniuxy.util.DBUtil;
import org.junit.Test;

import java.util.List;


public class OrderServiceImplTest {

	@Test
	public void addOrder() {
		OrderMapper mapper = DBUtil.getMapper(OrderMapper.class);
		Integer[] ids=new Integer[3];
		ids[0]=17;
		ids[1]=18;

		List<Order> list = mapper.findBySome("", null,ids);
		for (Order order : list) {
			System.out.println(order);
		}

	}

	@Test
	public void commitOrder() {
	}

	@Test
	public void getOrder() {
	}

	@Test
	public void updateOrder() {
	}

	@Test
	public void doDelete() {
	}

	@Test
	public void deleteCommitedOrders() {
	}

	@Test
	public void updateNum() {
	}
}