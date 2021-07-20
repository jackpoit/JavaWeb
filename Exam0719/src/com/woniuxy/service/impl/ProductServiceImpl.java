package com.woniuxy.service.impl;

import com.woniuxy.dao.ProductDao;
import com.woniuxy.dao.impl.ProductDaoImpl;
import com.woniuxy.entity.Product;
import com.woniuxy.service.ProductService;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImpl implements ProductService {
	private static ProductDao pdi = new ProductDaoImpl();
	@Override
	public boolean addProduct(Product product) {
		if (product == null) {
			return false;
		}
		try {
			return pdi.add(product)>0;
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
		return false;
	}

	@Override
	public Product selectOneById(int id) {
		try {
			return pdi.findById(id);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}

		return null;
	}

	@Override
	public List<Product> selectAll() {
		try {
			return pdi.findAll();
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
		return null;
	}
}
