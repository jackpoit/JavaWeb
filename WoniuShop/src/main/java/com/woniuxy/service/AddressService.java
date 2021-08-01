package com.woniuxy.service;

import com.woniuxy.entity.Address;

import java.util.List;

/**
 * @author: jackpoit
 * @date: 2021/8/1
 * @description:
 **/
public interface AddressService {
	/**
	 * 查询所有地址
	 * @param uid 用户id
	 * @return 地址集合
	 */
	List<Address> findAll(Integer uid);

	/**
	 * 添加地址
	 * @param address 地址对象
	 * @return true:成功
	 */
	boolean add(Address address);

	/**
	 * 根据地区id查邮编
	 * @param districtId 地区id
	 * @return 邮政编码
	 */
	String getPostCode(String districtId);
}
