<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>订单快照</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="bootstrap/js/jquery-3.5.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
</head>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.alipay.config.*" %>
<%@ page import="com.alipay.api.*" %>
<%@ page import="com.alipay.api.internal.util.*" %>
<%@ page import="com.woniuxy.service.impl.OrderServiceImpl" %>
<%@ page import="com.github.pagehelper.util.StringUtil" %>
<%@ page import="com.woniuxy.entity.Order" %>
<%@ page import="com.woniuxy.entity.Product" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.woniuxy.util.DBUtil" %>
<%@ page import="com.woniuxy.mapper.ProductMapper" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="com.woniuxy.mapper.AddressMapper" %>
<%@ page import="com.woniuxy.entity.Address" %>
<%
    /* *
     * 功能：支付宝服务器同步通知页面
     * 日期：2017-03-30
     * 说明：
     * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
     * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。


     *************************页面功能说明*************************
     * 该页面仅做页面展示，业务逻辑处理请勿在该页面执行
     */

    //获取支付宝GET过来反馈信息
    Map<String, String> params = new HashMap<String, String>();
    Map<String, String[]> requestParams = request.getParameterMap();
    for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
        String name = (String) iter.next();
        String[] values = (String[]) requestParams.get(name);
        String valueStr = "";
        for (int i = 0; i < values.length; i++) {
            valueStr = (i == values.length - 1) ? valueStr + values[i]
                    : valueStr + values[i] + ",";
        }
        //乱码解决，这段代码在出现乱码时使用
        valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
        params.put(name, valueStr);
    }
    boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名
    //——请在这里编写您的程序（以下代码仅作参考）——
    String total_amount = "";
    if (signVerified) {
        //商户订单号
        String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
        //支付宝交易号
        String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
        //付款金额
        total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

    } else {
        out.println("验签失败");
    }
    //——请在这里编写您的程序（以上代码仅作参考）——
    ProductMapper mapper = DBUtil.getMapper(ProductMapper.class);
    AddressMapper addressMapper = DBUtil.getMapper(AddressMapper.class);

    String uid = (String) session.getAttribute("uid");
    String idsStr = (String) session.getAttribute("ids");
    String aidStr = (String) session.getAttribute("address");
    Integer aid=null;
    Address address = new Address();
    String addr="";
    if ("".equals(aidStr)){
    	address.setUid(Integer.parseInt(uid));
        List<Address> addressList = addressMapper.findByCondition(address, "id", "DESC");
        if (!addressList.isEmpty()){
            aid=addressList.get(0).getId();
            addr = addressList.get(0).getArea() + addressList.get(0).getLocation();
        }
    }else {
    	aid=Integer.parseInt(aidStr);
        address.setId(Integer.parseInt(aidStr));
        List<Address> addressList = addressMapper.findByCondition(address, "id", "DESC");
        addr = addressList.get(0).getArea() + addressList.get(0).getLocation();
    }


    String[] idsStrs = idsStr.split(",");
    Integer[] ids = new Integer[idsStrs.length];
    for (int i = 0; i < ids.length; i++) {
        if (!StringUtil.isEmpty(idsStrs[i])) {
            ids[i] = Integer.parseInt(idsStrs[i]);
        }
    }
    OrderServiceImpl osi = new OrderServiceImpl();
    List<Order> list = osi.findByIds(ids);
    ArrayList<HashMap<String, Object>> res = new ArrayList<>();
    Product product = new Product();
    Order updateOrder=new Order();
    for (Order order : list) {
    	if (!"".equals(addr)){
            updateOrder.setId(order.getId());
            updateOrder.setAid(aid);
            osi.updateOrder(updateOrder);
        }
        mapper = DBUtil.getMapper(ProductMapper.class);
        HashMap<String, Object> map = new HashMap<>();
        map.put("order", order);
        product.setId(order.getPid());
        List<Product> pros = mapper.findByCondition(product);
        SqlSession sqlSession = DBUtil.openSqlSession(true);
        sqlSession.clearCache();
        Product product1 = pros.get(0);
        map.put("product", product1);
        res.add(map);
    }



    //更改订单状态
    boolean flag = osi.confirmOrderByIds(ids);
    session.removeAttribute("uid");
    session.removeAttribute("ids");
    session.removeAttribute("address");
    DBUtil.close();
    out.println("<div class='container' style='margin-top: 100px'>\n" +
            "    <h2 class='text-center'>订单快照</h2>\n" +
            "    <table class='table table-hover table-bordered'>\n" +
            "        <tr>\n" +
            "            <td>订单编号</td>\n" +
            "            <td>商品名称</td>\n" +
            "            <td>商品价格</td>\n" +
            "            <td>商品数量</td>\n" +
            "            <td>商品小计</td>\n" +
            "        </tr>\n" +
            "        <tbody>");
    Order order;
    for (HashMap<String, Object> map : res) {
        product = (Product) map.get("product");
        order = (Order) map.get("order");
        out.println("\n" +
                "<tr>"+
                "            <td>" + order.getOno() + "</td>\n" +
                "            <td>" + product.getPname() + "</td>\n" +
                "            <td> ¥<span>" + product.getPrice() + "</span></td>\n" +
                "            <td>" + order.getNum() + "</td>\n" +
                "            <td> ¥<span>" + (product.getPrice().multiply(new BigDecimal(order.getNum()))) + "</span></td>" +
                "</tr>");


    }
    out.println("  </tbody>\n" +
            "        <tr>\n" +
            "            <td>地址:</td>\n" +
            "            <td colspan='4'>" + addr + "</td>\n" +
            "        </tr>\n" +
            "        <tr>\n" +
            "            <td>总计</td>\n" +
            "            <td colspan='4'>" + total_amount + "</td>\n" +
            "        </tr>\n" +
            "    </table>\n" +
            "\n" +
            "<div class='row'>\n" +
            "    <div class='col-md-3 col-md-offset-3'>\n" +
            "        <a class='btn btn-primary' href='order?m=showCommitedOrder&uid="+uid+"'>返回订单中心</a>\n" +
            "    </div>\n" +
            "    <div class='col-md-3 '>\n" +
            "        <a class='btn btn-primary' href='page/user/index.jsp;'>返回首页</a>\n" +
            "    </div>\n" +
            "</div>"+
            "</div>");
%>
<%--<jsp:forward page="order?m=showCommitedOrder&uid=${uid}"></jsp:forward>--%>
<body>

    
</body>
</html>