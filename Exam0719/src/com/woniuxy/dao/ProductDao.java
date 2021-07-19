package com.woniuxy.dao;

import com.woniuxy.entity.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductDao {
	int add(Product e) throws SQLException;
	Product findById(int id) throws SQLException;
	List<Product> findAll() throws SQLException;
}
