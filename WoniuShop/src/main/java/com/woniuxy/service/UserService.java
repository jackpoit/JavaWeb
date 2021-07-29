package com.woniuxy.service;

import com.github.pagehelper.PageInfo;
import com.woniuxy.entity.User;

/**
 * @Author: rua
 * @Date: 2021/7/24 21:43
 * @Description:
 */
public interface UserService {
	User loginUser(String userName,String password);

	boolean registerUser(User user);

	PageInfo<User> findOnePage(int currentPage,String keyword);

	boolean	remove(Integer... ids);

	boolean edit(User user);

	boolean isUserExist(String name);
}
