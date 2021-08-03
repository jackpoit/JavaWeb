package com.woniuxy.mapper;

import com.woniuxy.entity.Product;
import com.woniuxy.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: jackpoit
 * @date: 2021/7/31 16:58
 * @description: 商品持久层接口
 */
public interface ProductMapper {

	/**
	 * 根据特定条件查询商品集合(product为null查所有)
	 *
	 * @param product 包含要查询信息的商品对象
	 * @return  商品集合
	 */
	List<Product> findByCondition(Product product);

	/**
	 * 根据特定条件查询商品集合并排序(product为null查所有)
	 *
	 * @param product 包含要查询信息的商品对象
	 * @param keyword 排序依据
	 * @return  商品集合
	 */
	List<Product> findOrderByKeyword(@Param("product") Product product, @Param("kw") String keyword, @Param("rule") String rule);


	/**
	 * 根据关键词查询
	 * @param keyword 关键词
	 * @return 商品集合
	 */
	List<Product> findByKeyword(String keyword);

	/**
	 * 添加商品
	 * @param product 商品集合
	 * @return 受影响行数
	 */
	int add(Product product);

	/**
	 * 删除
	 * @param ids id集合
	 * @return 受影响行数
	 */
	int deleteByIds(@Param("ids") Integer... ids);
}
