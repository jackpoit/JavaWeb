package com.woniuxy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author: rua
 * @Date: 2021/8/4 14:39
 * @Description: 订单实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
	private Integer id;        //主键
	private Integer uid;    //用户id
	private String ono;        //订单编号
	private Integer pid;    //商品id
	private String detail;    //款式 id
	private Integer num;    //商品数量
	private String startTime; //创建时间
	private String endTime;   //完成时间
	private Integer status; // 订单状态 1:未付款 未付款 2:未发货(已付款) 3:已发货(未收货) 4:已完成 :已完成
}
