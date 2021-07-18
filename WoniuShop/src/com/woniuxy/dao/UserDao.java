package com.woniuxy.dao;

import com.woniuxy.entity.User;
/**
 * 用户user 的持久层接口
 * 目的：给用户操作数据库提供一整套完整的CRUD API规范
 *	API(application programming interface)
 */
public interface UserDao extends GeneralDAO<User> {
}
