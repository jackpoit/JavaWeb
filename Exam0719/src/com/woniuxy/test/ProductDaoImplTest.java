package com.woniuxy.test;

import com.woniuxy.dao.impl.ProductDaoImpl;
import com.woniuxy.entity.Product;
import org.junit.Before;
import org.junit.Test;

import java.sql.SQLException;
import java.util.List;

import static org.junit.Assert.*;

public class ProductDaoImplTest {

	private ProductDaoImpl pdi;
	@Before
	public void init(){
		pdi=new ProductDaoImpl();
	}

	@Test
	public void add() {

	}

	@Test
	public void findById() {
		try {
			Product product= pdi.findById(2);
			System.out.println(product);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	}

	@Test
	public void findAll() {
		try {
			List<Product> list=pdi.findAll();
			System.out.println(list);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	}
}