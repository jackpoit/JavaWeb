package com.woniuxy.test;

import com.woniuxy.dao.impl.UserDaoImpl;
import com.woniuxy.entity.User;
import org.junit.Before;

import java.sql.SQLException;
import java.util.List;


public class UserDaoImplTest {
	private UserDaoImpl udi;
	@Before
	public void init(){
		udi=new UserDaoImpl();
	}

	@org.junit.Test
	public void add() {
		try {
			int rows=udi.add(new User("tari","10086","125125","623098@qq.com"));
			System.out.println(rows==0?"失败":"成功");
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	}

	@org.junit.Test
	public void deleteById() {
		try {
			int rows=udi.deleteById(2);
			System.out.println(rows==0?"失败":"成功");
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	}

	@org.junit.Test
	public void update() {
		try {
			int rows=udi.update(new User(2,"tom","123456","125125","623098@qq.com"));
			System.out.println(rows==0?"失败":"成功");
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	}

	@org.junit.Test
	public void findById() {
		try {
			User user=udi.findById(1);
			System.out.println(user);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	}

	@org.junit.Test
	public void findAll() {
		try {
			List<User> list=udi.findAll();
			System.out.println(list);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
	}

	@org.junit.Test
	public void findLike() {
	}

	@org.junit.Test
	public void findByPage(){
		List<User> list= null;
		try {
			list = udi.findByPage(1,3);
			System.out.println(list);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}

	}
}