package com.woniuxy.service;

import com.github.pagehelper.PageInfo;
import com.woniuxy.entity.Product;

import java.util.List;

/**
 * @author: jackpoit
 * @date: 2021/7/31 17:17
 * @description:
 */
public interface ProductService {

	/**
	 * 获取一个
	 * @return 商品对象
	 */
	Product getOnePro(int id);

	/**
	 * 首页商品获取
	 * @return 商品集合
	 */
	List<Product> findByPage(int currentPage);

	/**
	 * 根据关键词排序
	 * @param keyword 排序关键词
	 * @return 商品集合
	 */
	List<Product> getOrderByKeyword(Product product,String keyword ,String rule);

	/**
	 * 根据关键字查询页面
	 * @param keyword 关键字
	 * @return 包含list的页面信息对象
	 */
	PageInfo<Product> getOnePageByKeyword(int currentPage,String keyword,int pageSize,Integer fromPrice,Integer toPrice);

	/**
	 * 添加商品
	 * @param product 商品对象
	 * @return true添加成功
	 */
	boolean addPro(Product product);

	/**
	 * 更新商品
	 * @param product 商品对象
	 * @return true更新成功
	 */
	boolean editPro(Product product);

	/**
	 * 删除
	 * @param ids 要删除的id数组
	 * @return 成功-->true
	 */
	boolean doDelete(Integer... ids);

}
