package com.woniuxy.dao.impl;

import com.woniuxy.dao.UserDao;
import com.woniuxy.entity.User;
import com.woniuxy.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {
	@Override
	public int add(User user) throws SQLException {
		Connection conn = DBUtil.getConnection();
		String sql = "INSERT INTO t_user(username,password,phone,email)" +
				"VALUE(?,?,?,?) ";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setObject(1, user.getUsername());
		ps.setObject(2, user.getPassword());
		ps.setObject(3, user.getPhone());
		ps.setObject(4, user.getEmail());
		int rows = ps.executeUpdate();
		DBUtil.release(conn, ps);
		return rows;
	}

	@Override
	public int deleteById(int id) throws SQLException {
		Connection conn = DBUtil.getConnection();
		String sql = "DELETE FROM t_user WHERE id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setObject(1, id);
		int rows = ps.executeUpdate();
		DBUtil.release(conn, ps);
		return rows;
	}

	@Override
	public int update(User user) throws SQLException {
		Connection conn = DBUtil.getConnection();
		String sql = "UPDATE t_user SET username=?,password=?,phone=?,email=? WHERE id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setObject(1, user.getUsername());
		ps.setObject(2, user.getPassword());
		ps.setObject(3, user.getPhone());
		ps.setObject(4, user.getEmail());
		ps.setObject(5, user.getId());
		int rows = ps.executeUpdate();
		DBUtil.release(conn, ps);
		return rows;
	}

	@Override
	public User findById(int id) throws SQLException {
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT id,username,password,phone,email From t_user where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setObject(1, id);
		ResultSet rs = ps.executeQuery();
		User user = null;
		while (rs.next()) {            //ORM(Object Relational Mapping)
			Integer ids = rs.getInt("id");
			String username = rs.getString("username");
			String password = rs.getString("password");
			String phone = rs.getString("phone");
			String email = rs.getString("email");
			user=new User(ids,username,password,phone,email);
		}
		DBUtil.release(conn, ps, rs);
		return user;
	}

	@Override
	public List<User> findAll() throws SQLException {
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT id,username,password,phone,email From t_user";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		User user = null;
		List<User> list = new ArrayList<>();
		while (rs.next()) {            //ORM(Object Relational Mapping)
			Integer ids = rs.getInt("id");
			String username = rs.getString("username");
			String password = rs.getString("password");
			String phone = rs.getString("phone");
			String email = rs.getString("email");
			user=new User(ids,username,password,phone,email);
			list.add(user);
		}
		DBUtil.release(conn, ps, rs);
		return list.isEmpty() ? null : list;
	}

	@Override
	public List<User> findLike(String str) throws SQLException {
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT id,username,password,phone,email From t_user WHERE name LIKE ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setObject(1, str);
		ResultSet rs = ps.executeQuery();
		User user = null;
		List<User> list = new ArrayList<>();
		while (rs.next()) {            //ORM(Object Relational Mapping)
			Integer ids = rs.getInt("id");
			String username = rs.getString("username");
			String password = rs.getString("password");
			String phone = rs.getString("phone");
			String email = rs.getString("email");
			user=new User(ids,username,password,phone,email);
			list.add(user);
		}
		DBUtil.release(conn, ps, rs);
		return list.isEmpty() ? null : list;
	}

	@Override
	public User findByName(String username) throws SQLException {
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT id,username,password,phone,email From t_user where username=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setObject(1, username);
		ResultSet rs = ps.executeQuery();
		User user = null;
		while (rs.next()) {            //ORM(Object Relational Mapping)
			Integer ids = rs.getInt("id");
			String usernames = rs.getString("username");
			String password = rs.getString("password");
			String phone = rs.getString("phone");
			String email = rs.getString("email");
			user=new User(ids,usernames,password,phone,email);
		}
		DBUtil.release(conn, ps, rs);
		return user;
	}
}
