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
 * @Author: rua
 * @Date: 2021/7/24 22:03
 * @Description:
 */
public class UserServiceImpl implements UserService {

	/**
	 * 检查用户名是否存在
	 * @param name
	 * @return 存在返回true
	 */
	@Override
	public boolean isUserExist(String name) {
		if (StringUtil.isEmpty(name)){
			return false;
		}
		UserMapper mapper = DBUtil.getMapper(UserMapper.class);
		User user = new User();
		user.setUsername(name);
		List<User> list = mapper.findByCondition(user);
		DBUtil.close();
		return !list.isEmpty();
	}
	/**
	 * 登录
	 * @param userName
	 * @param password
	 * @return
	 */
	@Override
	public User loginUser(String userName, String password) {
		UserMapper mapper = DBUtil.getMapper(UserMapper.class);
		User user = mapper.findNameAndPassword(userName, password);
		DBUtil.close();
		return user;
	}

	/**
	 * 注册
	 * @param user
	 * @return
	 */
	@Override
	public boolean registerUser(User user) {
		if (user == null) {
			return false;
		}
		UserMapper mapper = DBUtil.getMapper(UserMapper.class);
		int row = mapper.add(user);
		DBUtil.close();
		return row > 0;
	}

	/**
	 * 分页
	 * @param currentPage
	 * @param keyword
	 * @return
	 */
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

	/**
	 * 删除
	 * @param ids
	 * @return
	 */
	@Override
	public boolean remove(Integer... ids) {
		UserMapper mapper = DBUtil.getMapper(UserMapper.class);
		int row = mapper.deleteByIds(ids);
		DBUtil.close();
		return row > 0;
	}

	/**
	 * 更新
	 * @param user
	 * @return
	 */
	@Override
	public boolean edit(User user) {
		if (user == null) {
			return false;
		}
		UserMapper mapper = DBUtil.getMapper(UserMapper.class);
		int row = mapper.update(user);
		DBUtil.close();
		return row > 0;
	}
}
