package com.woniuxy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.List;

/**
 * @Author: rua
 * @Date: 2021/8/5 10:24
 * @Description:
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderPageModal {

	private String ono;
	private String pname;
	private Integer status;
	private int pages;
	private int pageNum;
	List<HashMap<String,Object>> list;
}
