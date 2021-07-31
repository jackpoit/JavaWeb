package com.woniuxy.service.impl;

import com.woniuxy.entity.User;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class UserServiceImplTest {
	UserServiceImpl usi;
	@Before
	public void setUp() throws Exception {
		usi=new UserServiceImpl();
	}

	@Test
	public void isUserExist() {
	}

	@Test
	public void doLogin() {
	}

	@Test
	public void doRegister() {
		User user = new User("sss", null, 0);
		user.setEmail(null);
		boolean flag = usi.doRegister(user);
		System.out.println(flag);
	}

	@Test
	public void doDelete() {
	}

	@Test
	public void doUpdate() {
	}

	@Test
	public void findOnePage() {
	}
}