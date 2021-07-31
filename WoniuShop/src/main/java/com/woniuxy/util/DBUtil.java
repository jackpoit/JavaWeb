package com.woniuxy.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

/**
 * @author: jackpoit
 * @date: 2021/7/23 11:45
 * @description: 基于Mybatis框架的数据库工具类
 */
public class DBUtil {
	private static SqlSessionFactory factory;
	private static ThreadLocal<SqlSession> threadLocal=new ThreadLocal<>();
	//类变量 threadLocal是共用的 ,每有一个线程调用openSqlSession 就会在他的map里添加一个键值对

	//在类加载时优先加载且只会执行一次(一般用于初始化操作的
	static {
		try {
			//1.创建一个Mybatis工厂(SqlSessionFactory)的建造者
			SqlSessionFactoryBuilder factoryBuilder = new SqlSessionFactoryBuilder();
			//将Mybatis核心配置文件读取成IO资源
			InputStream inStream = Resources.getResourceAsStream("mybatis-config.xml");
			//2.建造者来建造工厂(核心配置文件)
			 factory = factoryBuilder.build(inStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	/**
	 * @return 返回一个基于Mybatis的sqlSession会话(本质就是数据库连接对象)
	 * factory.openSession(false); 手动提交(默认) 用于事务
	 * factory.openSession(true);  自动提交
	 */
	public static SqlSession openSqlSession(boolean flag){
		//1.先判断该线程内是否存在sqlSession
		SqlSession sqlSession = threadLocal.get();
		if (sqlSession==null){ //如果会话不存在
			sqlSession = factory.openSession(flag); //新建一个会话
			threadLocal.set(sqlSession); //把新方法放进去
		}
		return sqlSession;
	}

	/**
	 * 获取Mybatis接口Mapper的代理对象(非事务)
	 * @param clazz 接口的字节码对象
	 * @param <T> 接口类型
	 * @return 接口Mapper的代理对象
	 */
	public static <T> T getMapper(Class<T> clazz){
		SqlSession sqlSession = openSqlSession(true); //自动提交
		return sqlSession.getMapper(clazz);
	}
	/**
	 * 获取Mybatis接口Mapper的代理对象(事务)
	 * @param clazz 接口的字节码对象
	 * @param <T> 接口类型
	 * @return 接口Mapper的代理对象
	 */
	public static <T> T getTransMapper(Class<T> clazz){
		SqlSession sqlSession = openSqlSession(false); //手动提交
		return sqlSession.getMapper(clazz);
	}

	/**
	 * 提交sqlSession[事务]
	 */
	public static void commit(){
		SqlSession sqlSession = openSqlSession(false);
		sqlSession.commit();
	}
	/**
	 * 回滚sqlSession[事务]
	 */
	public static void rollback(){
		SqlSession sqlSession = openSqlSession(false);
		sqlSession.rollback();
	}
	/**
	 * 归还sqlSession[事务+非事务]
	 */
	public static void close(){
		SqlSession sqlSession = threadLocal.get();
		if (sqlSession!=null){
			sqlSession.close();
		}
		threadLocal.remove();
	}






}
