package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/**
 * @Author: rua
 * @Date: 2021/8/5 19:42
 * @Description:
 */
public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016100100641271";

	// 商户私钥，您的PKCS8格式RSA2私钥
	public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCBy4Ar0vCYT3yi1vROil0Y0U5cT33AEdu86GrbEOBQpO35tDIxvHa3CXhZf5ceLr3fELOywqtyjbAZ2in20RiBkQYaT5T4swF8QxRVpuobaGrwylHxoIbTu81lW7sgDGcHcaBbTpHoj26fCbqH1moVLKlbtbqJUYVd7s2B0nrIOOYh6ZgH4e8buBlKnAfmTmg5UOxPS4Mo5+UetEBfBp7Tly/zGEj1VVBx3qo776Lt/VZi9jdeS6kTLw3Fu7OvO+Q8lplenSL0n956BRuOZoNqYOEyebTIaAb124Oyr2rmKFjHwVG0SVIG2pZ99/GpnB4FxlLtOyVoNahXMCikuFOBAgMBAAECggEAMZzzCk1gUCgaETivPBJhkan4FQsBm1h4MRZ6OfCSfeD9YjSB90b97es9yKAfyJa/VzPQLKWC2Y/VX5xn7ANzJZukxIvk+seZ6sDNVgwucnmQXyhG+GCPCQJBedv9hDuZalwBmsVGuqmQ9FPIrEHGXP+sYPTvL6wsmYI9pcEp07x4VLTf2bHEqc+Nmcq1tnGa1OvYDBbqBylxYn1d7LPwIxlBA+h2VcsDX4j9+LZdpI0ehlDmFb0enbtok0EDwVAm8rEuWRmNAEmlLdqZdfB34oSOMxuGZwWITtTFzhidXNyhSeaVJc/SW5Sp5Kbc3Ve2tdRBRwRGu5bKqNkVeLSPLQKBgQDFjrk3AU1+udThEcrvrmsnsAbV6cJXMwCFuvQ7+rNm5VxVp9DVhKlZQOSnk9Z7vmLWBynzrxAc3pbN4/AvZ5LGYNCRUgwTt2OvZ6hmyjO2O6mh4tBxONtikFvl99XKHgA9hUIp+u1ywzi3xD4cn4ahy8tlZmyJUU1ZBu1hKpzeJwKBgQCoMQgr0aije4E5VRHOrgH1NJ3nwdCvJJ723mxegPCqpoIEidNefP4TJTNN0k9kiEmqyLgzOaODgq3USbpb0aaZnTCtmLPyWe8gbsvwOeSlr4N1o79H7c+/e9Y07HB6fvzTq04+7X9Pd2RgZKIuBpKmHpU/BYTXGKOs6hemr5VyFwKBgAe9t/Q30NmOXpETKWiK5RgBBcOMDVltXi/fS4KuKCl4A0437S7wq9IbgNowKM9gfm70iOhLi84VysL2k4rH/DBZytJm7KI5JWbSIP8mHTCe1d7KDHDjUXVjQraYJ4Br/IZsmlMaygMdMzPANM7aUWQ1oBqxEL+wt98tLlAIY20xAoGBAJ90pO+OPRiJPfFSAqj09ew4L0CK0sNJr+AS7aEHE6RmajvNQ3SAgg06ppIwQo7oWxcsZt5B1hEXcqAiKilk8VMP4Rej/25T707LXFPrPygJ51M/pFiYUO6UhHf2dYjdHeu7rFoipiF76tEsd0m1d5FAy3RNUizvMjX8VeH083WPAoGAf+hK9CqKlXEr9eRyU1V+rfOqWgK/YwB/yb9AQ6fEGMRiNKPnp80COaVq0NG3g4ULkgfY1nVUsIIbH3Hvo/RqLH8m2UpcE2/2jhXKGF5gBYUZsKo24r0mTTPEHbFKmk+a9t1R7VKPFhmfqoWOjfZKaGD+Q62+vd86dl5pAWj/Y9g=";

	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
	public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgSklhhZgpmODaTqZ1Bnw9Cp/uim9uRaXB8Q4OnNRYZa9MJnhZ9UvP61gxWUGGD3iK8D56XDkgj2HM5EO/XxVZ0u74xRDmHvFH/yKKiJd0V40xL4XKqUQZ1iaTcmMawkEjodFBWSHNb7eL013RPobdKcd9scWFNdhntupJ9cTelcrtIVSGdl6mx0QH2tWh07V9iq6c1Uj/Ds489gT/ASKeunvIw/QKO50ZJQwtxsQvUFyxI2yEx6XW8dWZObwfLeQGj9m1WQdspfTf6z9734tBo6A7G257yd/CbjfTIDhgHQsvPovs0BXvplELUnNQwaQD60OIA0Xwpmyl1jHwKCtGwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/page/user/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";

	// 字符编码格式
	public static String charset = "utf-8";

	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

	/**
	 * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
	 *
	 * @param sWord 要写入日志里的文本内容
	 */
	public static void logResult(String sWord) {
		FileWriter writer = null;
		try {
			writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis() + ".txt");
			writer.write(sWord);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (writer != null) {
				try {
					writer.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
