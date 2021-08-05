package com.woniuxy.service;

import com.github.pagehelper.PageInfo;
import com.woniuxy.entity.User;

/**
 * @author: jackpoit
 * @date: 2021/7/24 21:43
 * @description: 用户类业务逻辑层接口
 */
public interface UserService {
	/**
	 * 登录
	 * @param user 包含用户信息的对象
	 * @return 查询到不含密码属性的用户集合
	 */
	User doLogin(User user);

	/**
	 * 注册
	 * @param user 用户对象
	 * @return 成功-->true
	 */
	boolean doRegister(User user);

	/**
	 * 删除
	 * @param ids 要删除的id数组
	 * @return 成功-->true
	 */
	boolean doDelete(Integer... ids);

	/**
	 * 更新
	 * @param user 用户对象
	 * @return 成功-->true
	 */
	boolean doUpdate(User user);

	/**
	 * 检查用户名是否存在
	 * @param name 用户名
	 * @return 存在-->true
	 */
	boolean isUserExist(String name);

	/**
	 * 分页查询
	 * @param currentPage 当前页
	 * @param keyword 关键词
	 * @return 包含用户集合和页面信息的分页对象
	 */
	PageInfo<User> findOnePage(int currentPage,Integer id,String username,String mobile);

	/**
	 * 根据id查用户
	 * @param id 用户id
	 * @return 用户对象
	 */
	User findById(int id);
}
