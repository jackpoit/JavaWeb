package com.woniuxy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @Author: rua
 * @Date: 2021/8/4 9:57
 * @Description:
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProDetails {
	private Integer id;
	private Integer pid;
	private String style;
	private String edition;
	private BigDecimal price;



}
