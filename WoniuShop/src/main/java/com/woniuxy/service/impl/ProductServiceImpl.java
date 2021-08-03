package com.woniuxy.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.woniuxy.entity.Product;
import com.woniuxy.mapper.ProductMapper;
import com.woniuxy.mapper.UserMapper;
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
	public List<Product> getOrderByKeyword(Product product,String keyword,String rule) {
		ProductMapper mapper = DBUtil.getMapper(ProductMapper.class);
		PageHelper.startPage(1,8);
		List<Product> list = mapper.findOrderByKeyword(product, keyword,rule);
		DBUtil.close();
		return list.isEmpty()?null:list;
	}

	@Override
	public PageInfo<Product> getOnePageByKeyword(int currentPage,String keyword,int pageSize,Integer fromPrice,Integer toPrice) {
		if (keyword==null){
			keyword="";
		}
		ProductMapper mapper = DBUtil.getMapper(ProductMapper.class);
		PageHelper.startPage(currentPage,pageSize);
		List<Product> list = mapper.findByNameAndPrice(keyword,fromPrice,toPrice);
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

	@Override
	public boolean editPro(Product product) {
		if (product==null)
			return false;
		ProductMapper mapper = DBUtil.getMapper(ProductMapper.class);
		int row = mapper.update(product);
		DBUtil.close();
		return row>0;
	}

	@Override
	public boolean doDelete(Integer... ids) {
		if (ids == null) {
			return false;
		}
		ProductMapper mapper = DBUtil.getMapper(ProductMapper.class);
		int row = mapper.deleteByIds(ids);
		DBUtil.close();
		return row > 0;
	}
}
