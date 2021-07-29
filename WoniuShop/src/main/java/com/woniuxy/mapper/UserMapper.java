package com.woniuxy.mapper;

import com.woniuxy.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: rua
 * @Date: 2021/7/24 21:40
 * @Description:
 */
public interface UserMapper {

	/**
	 * 根据用户名查找用户
	 * @param userName 用户名
	 * @return 用户对象
	 */
	User findByName(String userName);

	/**
	 * 添加对象
	 * @param user 用户对象
	 * @return 受影响行数
	 */
	int add(User user);

	/**
	 * 查询所有
	 * @return 用户集合
	 */
	List<User> findAll();

	/**
	 * 根据关键词查用户
	 * @param keyword 关键词
	 * @return 用户集合
	 */
	List<User> findLimitByKeyword(@Param("kw") String keyword, @Param("start") int start, @Param("num") int num);

	/**
	 * 根据关键词查用户总数
	 * @param keyword 关键词
	 * @return 总数
	 */
	long count(String keyword);

	int deleteByIds(@Param("ids") Integer...ids);//根据多个id来删除

	int update(User user);//更新用户对象

	User findNameAndPassword(@Param("username") String username,@Param("pwd") String password);

	List<User> findByKeyword( String keyword);

	List<User> findByCondition(User user);
}

