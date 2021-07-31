package com.woniuxy.exception;

/**
 * @author: jackpoit
 * @date: 2021/7/28 16:49
 * @description: 自定义异常
 */
public class NoSuchMethodException extends RuntimeException{
	private static final long serialVersionUID = 1L;

	public NoSuchMethodException() {
	}

	public NoSuchMethodException(String message) {
		super(message);
	}

	public NoSuchMethodException(String message, Throwable cause) {
		super(message, cause);
	}

	public NoSuchMethodException(Throwable cause) {
		super(cause);
	}

	public NoSuchMethodException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}
}
