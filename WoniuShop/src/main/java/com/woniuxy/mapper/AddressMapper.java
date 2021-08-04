package com.woniuxy.mapper;

import com.woniuxy.entity.Address;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: jackpoit
 * @date: 2021/8/1
 * @description: 地址持久层接口
 **/
public interface AddressMapper {
	/**
	 * 根据条件查询地址
	 * @param address 包含条件信息的地址对象
	 * @return 地址对象集合
	 */
	List<Address> findByCondition(@Param("add") Address address, @Param("kw") String keyword, @Param("rule") String rule);


	/**
	 * 添加地址
	 * @param address 地址对象
	 * @return 受影响行数
	 */
	int add(Address address);

	/**
	 * 更新默认地址
	 * @param address 地址对象
	 * @return 受影响行数
	 */
	int updateDefault(Address address);

	/**
	 * 更新普通地址
	 * @param uid 用户地址
	 * @return 受影响行数
	 */
	int updateNormal(int uid);

	/**
	 * 根据地区id查邮编
	 * @param districtId 地区id
	 * @return 邮政编码
	 */
	String findPostCode(String districtId);

	/**
	 * 根据id删除
	 * @param id 地址id
	 * @return 受影响行数
	 */
	int deleteById(int id);


}
