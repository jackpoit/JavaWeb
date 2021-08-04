package com.woniuxy.service;

import com.woniuxy.entity.ProDetails;

import java.util.List;

/**
 * @author :jackpoit
 * @description: 商品界面的业务逻辑层
 */
public interface ProDetailsService {

	/**
	 *  根据pid查询款式集合
	 * @param pid 商品id
	 * @return 款式集合
	 */
	List<ProDetails> getDetailsByPid(int pid);
}
