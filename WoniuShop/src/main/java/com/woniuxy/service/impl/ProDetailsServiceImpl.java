package com.woniuxy.service.impl;

import com.woniuxy.entity.ProDetails;
import com.woniuxy.mapper.ProDetailsMapper;
import com.woniuxy.service.ProDetailsService;
import com.woniuxy.util.DBUtil;

import java.util.List;

/**
 * @Author: rua
 * @Date: 2021/8/4 10:28
 * @Description:
 */
public class ProDetailsServiceImpl implements ProDetailsService {

	@Override
	public List<ProDetails> getDetailsByPid(int pid) {
		ProDetailsMapper mapper = DBUtil.getMapper(ProDetailsMapper.class);
		List<ProDetails> list = mapper.findByPid(pid);
		DBUtil.close();
		return list.isEmpty()?null:list;
	}
}
