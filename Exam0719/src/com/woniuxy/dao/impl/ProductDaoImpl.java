package com.woniuxy.dao.impl;

import com.woniuxy.dao.ProductDao;
import com.woniuxy.entity.Product;
import com.woniuxy.utils.DBUtil;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoImpl implements ProductDao {
	@Override
	public int add(Product product) throws SQLException {
		Connection conn = DBUtil.getConnection();
		String sql = "INSERT INTO t_product(pname,pinfo,price,stock,sale,image)" +
				"VALUE(?,?,?,?,?,?) ";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setObject(1, product.getPname());
		ps.setObject(2, product.getPinfo());
		ps.setObject(3, product.getPrice().toString());
		ps.setObject(4, product.getStock());
		ps.setObject(5, product.getSale());
		ps.setObject(6, product.getImage());
		int rows = ps.executeUpdate();
		DBUtil.release(conn, ps);
		return rows;
	}





	@Override
	public Product findById(int id) throws SQLException {
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT id,pname,pinfo,price,stock,sale,image From t_product where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setObject(1, id);
		ResultSet rs = ps.executeQuery();
		Product product = null;
		while (rs.next()) {            //ORM(Object Relational Mapping)
			Integer ids = rs.getInt("id");
			String pname = rs.getString("pname");
			String pinfo = rs.getString("pinfo");
			BigDecimal price=rs.getBigDecimal("price");
			Integer stock = rs.getInt("stock");
			Integer sale = rs.getInt("sale");
			String image = rs.getString("image");
			product=new Product(ids,pname,pinfo,price,stock,sale,image);

		}
		DBUtil.release(conn, ps, rs);
		return product;
	}



	@Override
	public List<Product> findAll() throws SQLException {
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT id,pname,pinfo,price,stock,sale,image From t_product";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		Product product = null;
		List<Product> list = new ArrayList<>();
		while (rs.next()) {            //ORM(Object Relational Mapping)
			Integer ids = rs.getInt("id");
			String pname = rs.getString("pname");
			String pinfo = rs.getString("pinfo");
			BigDecimal price=rs.getBigDecimal("price");
			Integer stock = rs.getInt("stock");
			Integer sale = rs.getInt("sale");
			String image = rs.getString("image");
			product=new Product(ids,pname,pinfo,price,stock,sale,image);
			list.add(product);
		}
		DBUtil.release(conn, ps, rs);
		return list.isEmpty() ? null : list;
	}


}
