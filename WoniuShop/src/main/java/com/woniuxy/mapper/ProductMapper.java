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

	/**
	 * 根据名字价格搜索
	 * @param keyword 名字关键词
	 * @return 商品集合
	 */
	List<Product> findByNameAndPrice(@Param("kw") String keyword,@Param("fp") Integer from,@Param("tp") Integer to);

	/**
	 * 更新商品信息
	 * @param product 包含商品信息的对象
	 * @return 受影响行数
	 */
	int update(Product product);

	/**
	 * 设置销量和库存
	 * @param id 商品id
	 * @param num	数量
	 * @param isBuy "true":销量+ 库存-
	 * @return 受影响行数
	 */
	int setSaleAndStock(@Param("id") int id,@Param("num") int num,@Param("isBuy") String isBuy);
}
