package com.woniuxy.service.impl;

import com.woniuxy.entity.Address;
import com.woniuxy.mapper.AddressMapper;
import com.woniuxy.service.AddressService;
import com.woniuxy.util.DBUtil;

import java.util.List;

/**
 * @author: jackpoit
 * @date: 2021/8/1
 * @description:
 **/
public class AddressServiceImpl implements AddressService {
	@Override
	public List<Address> findAll(Integer uid) {
		if (uid==null){
			return null;
		}
		AddressMapper mapper = DBUtil.getMapper(AddressMapper.class);
		Address address = new Address();
		address.setUid(uid);
		List<Address> list = mapper.findByCondition(address, "isdefault", "DESC");
		DBUtil.close();
		return list.isEmpty()?null:list;
	}

	@Override
	public boolean add(Address address) {
		if (address==null){
			return false;
		}
		AddressMapper mapper = DBUtil.getMapper(AddressMapper.class);
		int row = mapper.add(address);
		DBUtil.close();
		return row>0;
	}

	@Override
	public String getPostCode(String districtId) {
		AddressMapper mapper = DBUtil.getMapper(AddressMapper.class);
		String postCode = mapper.findPostCode(districtId);
		DBUtil.close();
		return postCode;
	}
}
