package com.woniuxy.service.impl;

import com.woniuxy.entity.Address;
import com.woniuxy.mapper.AddressMapper;
import com.woniuxy.service.AddressService;
import com.woniuxy.util.DBUtil;

import java.sql.SQLException;
import java.util.List;

/**
 * @author: jackpoit
 * @date: 2021/8/1
 * @description:
 **/
public class AddressServiceImpl implements AddressService {
	@Override
	public List<Address> findAll(Integer uid) {
		if (uid == null) {
			return null;
		}
		AddressMapper mapper = DBUtil.getMapper(AddressMapper.class);
		Address address = new Address();
		address.setUid(uid);
		List<Address> list = mapper.findByCondition(address, "isdefault", "DESC");
		DBUtil.close();
		return list.isEmpty() ? null : list;
	}

	@Override
	public boolean add(Address address) {
		if (address == null) {
			return false;
		}
		if (address.getIsDefault() == 0) {
			AddressMapper mapper = DBUtil.getMapper(AddressMapper.class);
			int row = mapper.add(address);
			DBUtil.close();
			return row > 0;
		} else {
			AddressMapper transMapper = DBUtil.getTransMapper(AddressMapper.class);
			try {
				int row = transMapper.updateNormal(address.getUid());
				if (row == 0) {
					List<Address> list = transMapper.findByCondition(new Address(address.getUid(), 1), "id", " ");
					if (list.size() == 1) {
						throw new SQLException();
					}
				}
				row = transMapper.add(address);
				if (row == 0) {
					throw new SQLException();
				}
				DBUtil.commit();
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				DBUtil.rollback();
			} finally {
				DBUtil.close();
			}
			return false;
		}
	}


	@Override
	public String getPostCode(String districtId) {
		AddressMapper mapper = DBUtil.getMapper(AddressMapper.class);
		String postCode = mapper.findPostCode(districtId);
		DBUtil.close();
		return postCode;
	}

	@Override
	public boolean deleteById(Integer id) {
		if (id == null) {
			return false;
		}
		AddressMapper mapper = DBUtil.getMapper(AddressMapper.class);
		int row = mapper.deleteById(id);
		DBUtil.close();
		return row > 0;
	}

	@Override
	public boolean update(Address address) {
		if (address == null) {
			return false;
		}
		if (address.getIsDefault() == 0||address.getIsDefault()==null) {
			AddressMapper mapper = DBUtil.getMapper(AddressMapper.class);
			int row = mapper.updateDefault(address);
			DBUtil.close();
			return row > 0;
		} else {
			AddressMapper transMapper = DBUtil.getTransMapper(AddressMapper.class);
			try {
				int row = transMapper.updateNormal(address.getUid());
				if (row == 0) {
					List<Address> list = transMapper.findByCondition(new Address(address.getUid(), 1), "id", " ");
					if (list.size() == 1) {
						throw new SQLException();
					}
				}
				row = transMapper.updateDefault(address);
				if (row == 0) {
					throw new SQLException();
				}
				DBUtil.commit();
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				DBUtil.rollback();
			} finally {
				DBUtil.close();
			}
			return false;
		}
	}

	public boolean setDefault(Address address) {
		if (address == null) {
			return false;
		}
		if (address.getUid()==null){
			return false;
		}
		AddressMapper transMapper = DBUtil.getTransMapper(AddressMapper.class);
		try {
			int row = transMapper.updateNormal(address.getUid());
			if (row == 0) {
				List<Address> list = transMapper.findByCondition(new Address(address.getUid(), 1), "id", " ");
				if (list.size() == 1) {
					throw new SQLException();
				}
			}
			row = transMapper.updateDefault(address);
			if (row == 0) {
				throw new SQLException();
			}
			DBUtil.commit();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			DBUtil.rollback();
		} finally {
			DBUtil.close();
		}
		return false;
	}


	public boolean setNormal(Integer uid) {
		if (uid == null) {
			return false;
		}
		AddressMapper mapper = DBUtil.getMapper(AddressMapper.class);
		int row = mapper.updateNormal(uid);

		DBUtil.close();
		return row > 0;

	}
}
