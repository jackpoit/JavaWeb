package com.woniuxy.service.impl;

import com.woniuxy.entity.Product;
import com.woniuxy.mapper.ProductMapper;
import com.woniuxy.util.DBUtil;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @author: jackpoit
 * @date: 2021/8/1
 * @description:
 **/
public class ProductServiceImplTest {
		private ProductServiceImpl psi;
	@Before
	public void setUp() throws Exception {
		psi=new ProductServiceImpl();
	}

	@Test
	public void getAll() {
	}

	@Test
	public void findByPage() {
		ProductMapper mapper = DBUtil.getMapper(ProductMapper.class);
		List<Product> list = mapper.findByNameAndPrice("", 110000, null);
		for (Product product : list) {
			System.out.println(product);
		}
	}

	@Test
	public void getOrderByKeyword() {
		List<Product> list = psi.getOrderByKeyword(null,"sale","DESC");
		for (Product product : list) {
			System.out.println(product);
		}
	}
}