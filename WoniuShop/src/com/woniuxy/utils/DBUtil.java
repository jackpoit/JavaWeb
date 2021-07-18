package com.woniuxy.utils;

import com.alibaba.druid.pool.DruidDataSource;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DBUtil {
	private static DruidDataSource dataSource=null;

	// 静态代码块【当类加载的时候优先被加载，且只会加载一次，一般用于加载资源】

	//解耦
	static {
		//加载属性文件
		InputStream inStream = DBUtil.class.getClassLoader().getResourceAsStream("db.properties");
		Properties props=new Properties();
		try {
			props.load(inStream); //加载属性文件
			String driver = props.getProperty("pool.driver");
			String url = props.getProperty("pool.url");
			String user = props.getProperty("pool.user");
			String password = props.getProperty("pool.password");
			int initSize =Integer.parseInt(props.getProperty("pool.initSize"));
			int maxSize= Integer.parseInt(props.getProperty("pool.maxSize"));

			dataSource=new DruidDataSource();
			dataSource.setDriverClassName(driver);
			dataSource.setUrl(url);
			dataSource.setUsername(user);
			dataSource.setPassword(password);
			dataSource.setInitialSize(initSize);//初始准备5个数据库连接对象
			dataSource.setMaxActive(maxSize);//数据库最大可以存在20个连接对象
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/**
	 *获取数据库连接
	 * @return
	 */
	public static Connection getConnection(){
		try {
			return dataSource.getConnection();
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
		return null;
	}


	/**
	 * 释放资源
	 * @param conn  连接对象
	 * @param ps 预编译对象
	 * @param  rs 结果集对象
	 */
	public static void release(Connection conn, PreparedStatement ps, ResultSet rs){
		try {
			if (rs!=null){
				rs.close();
			}
			if (ps!=null) {
				ps.close();
			}
			if (conn!=null){
				conn.close();
			}
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	}
	public static void release(Connection conn, PreparedStatement ps){
		release(conn, ps,null);
	}

	public static void main(String[] args) {
		System.out.println(getConnection());
	}

}
