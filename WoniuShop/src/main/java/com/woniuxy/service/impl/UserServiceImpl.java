package com.woniuxy.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.woniuxy.entity.User;
import com.woniuxy.mapper.UserMapper;
import com.woniuxy.service.UserService;
import com.woniuxy.util.DBUtil;
import java.util.List;

/**
 * @author: jackpoit
 * @date: 2021/7/24 21:43
 * @description: 用户业务逻辑层实现类
 */
public class UserServiceImpl implements UserService {

	@Override
	public boolean isUserExist(String name) {
		if (StringUtil.isEmpty(name)) {
			return false;
		}
		UserMapper mapper = DBUtil.getMapper(UserMapper.class);
		User user = new User();
		user.setUsername(name);
		List<User> list = mapper.findByCondition(user);
		DBUtil.close();
		return !list.isEmpty();
	}

	@Override
	public User doLogin(User user) {
		if (user == null) {
			return null;
		}
		UserMapper mapper = DBUtil.getMapper(UserMapper.class);
		List<User> list = mapper.findByCondition(user);
		DBUtil.close();
		return list.size() == 1 ? list.get(0) : null;
	}

	@Override
	public boolean doRegister(User user) {
		if (user == null) {
			return false;
		}
		UserMapper mapper = DBUtil.getMapper(UserMapper.class);
		int row = mapper.add(user);
		DBUtil.close();
		return row > 0;
	}

	@Override
	public boolean doDelete(Integer... ids) {
		if (ids == null) {
			return false;
		}
		UserMapper mapper = DBUtil.getMapper(UserMapper.class);
		int row = mapper.deleteByIds(ids);
		DBUtil.close();
		return row > 0;
	}

	@Override
	public boolean doUpdate(User user) {
		if (user == null) {
			return false;
		}
		UserMapper mapper = DBUtil.getMapper(UserMapper.class);
		int row = mapper.update(user);
		DBUtil.close();
		return row > 0;
	}

	@Override
	public PageInfo<User> findOnePage(int currentPage, String keyword) {
		if (currentPage < 0 || keyword == null) {
			return null;
		}
		UserMapper mapper = DBUtil.getMapper(UserMapper.class);
		PageHelper.startPage(currentPage, 5);
		List<User> list = mapper.findByKeyword(keyword);
		PageInfo<User> info = new PageInfo<>(list);
		DBUtil.close();
		return info;
	}

}
