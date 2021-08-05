package com.woniuxy.mapper;

import com.woniuxy.entity.Order;
import com.woniuxy.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: jackpoit
 * @date: 2021/7/24 21:40
 * @description: 用户持久层接口
 */
public interface UserMapper {
	/**
	 * 添加员工
	 * @param user 用户对象
	 * @return 受影响行数
	 */
	int add(User user);

	/**
	 * 删除员工
	 * @param ids 员工id数组
	 * @return 受影响行数
	 */
	int deleteByIds(@Param("ids") Integer... ids);

	/**
	 * 更新员工
	 * @param user 包含更新信息的员工对象
	 * @return 受影响行数
	 */
	int update(User user);

	/**
	 * 根据特定条件查询员工集合(user为null查所有)
	 * @param user 包含要查询信息的员工对象
	 * @return 查询到的员工集合
	 */
	List<User> findByCondition(User user);

	/**
	 * 根据关键词查id username mobile
	 * @param keyword 关键词
	 * @return 查询到的员工集合
	 */
	List<User> findByKeyword(String keyword);

	/**
	 * 根据一些关键词查询
	 * @param id 用户编号
	 * @param username 用户名
	 * @param mobile 手机号
	 * @return  用户集合
	 */
	List<User> findBySome(@Param("id")Integer id, @Param("username") String username,@Param("mobile") String mobile);

}

