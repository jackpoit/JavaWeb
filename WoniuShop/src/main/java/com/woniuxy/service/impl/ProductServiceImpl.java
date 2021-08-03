package com.woniuxy.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.woniuxy.entity.Product;
import com.woniuxy.mapper.ProductMapper;
import com.woniuxy.service.ProductService;
import com.woniuxy.util.DBUtil;

import javax.servlet.annotation.WebServlet;
import java.util.List;

/**
 * @author: jackpoit
 * @date: 2021/7/24 21:43
 * @description: 商品业务逻辑层实现类
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

	@Override
	public List<Product> getOrderByKeyword(String keyword,String rule) {
		ProductMapper mapper = DBUtil.getMapper(ProductMapper.class);
		PageHelper.startPage(1,8);
		List<Product> list = mapper.findOrderByKeyword(null, keyword,rule);
		DBUtil.close();
		return list.isEmpty()?null:list;
	}

	@Override
	public PageInfo<Product> getOnePageByKeyword(int currentPage,String keyword,int pageSize) {
		if (keyword==null){
			keyword="";
		}

		ProductMapper mapper = DBUtil.getMapper(ProductMapper.class);
		PageHelper.startPage(currentPage,pageSize);
		List<Product> list = mapper.findByKeyword(keyword);
		PageInfo<Product> info = new PageInfo<>(list);
		DBUtil.close();
		return info;
	}

	@Override
	public boolean addPro(Product product) {
		if (product==null)
			return false;
		ProductMapper mapper = DBUtil.getMapper(ProductMapper.class);
		int row = mapper.add(product);
		DBUtil.close();
		return row>0;
	}
}
