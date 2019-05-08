package com.rentCarSystem.exception;

public class SystemError extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public SystemError() {
		super();
	}

	public SystemError(String message, Throwable cause) {
		super(message, cause);
	}

	public SystemError(String message) {
		super(message);
	}

	public SystemError(Throwable cause) {
		super(cause);
	}
	
}
