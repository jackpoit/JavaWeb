package com.woniuxy.mapper;

import com.woniuxy.entity.ProDetails;

import java.util.List;

/**
 * @Author: rua
 * @Date: 2021/8/4 10:01
 * @Description: 商品展示页面的持久层
 */
public interface ProDetailsMapper {

	/**
	 *  根据商品id 查款式
	 * @param pid 商品id
	 * @return 该id的款式集合
	 */
	List<ProDetails> findByPid(int pid);

}
