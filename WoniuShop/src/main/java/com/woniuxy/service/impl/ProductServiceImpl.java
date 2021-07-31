package com.woniuxy.service.impl;

import com.github.pagehelper.PageHelper;
import com.woniuxy.entity.Product;
import com.woniuxy.mapper.ProductMapper;
import com.woniuxy.service.ProductService;
import com.woniuxy.util.DBUtil;

import javax.servlet.annotation.WebServlet;
import java.util.List;

/**
 * @Author: rua
 * @Date: 2021/7/31 17:19
 * @Description:
 */
public class ProductServiceImpl implements ProductService {
	@Override
	public List<Product> getAll() {
		ProductMapper mapper = DBUtil.getMapper(ProductMapper.class);
		List<Product> list = mapper.findByCondition(null);
		DBUtil.close();
		return list.isEmpty()?null:list;
	}

	@Override
	public List<Product> findByPage(int currentPage) {
		ProductMapper mapper = DBUtil.getMapper(ProductMapper.class);
		PageHelper.startPage(currentPage,8);
		List<Product> list = mapper.findByCondition(null);
		DBUtil.close();
		return list.isEmpty()?null:list;

	}
}
