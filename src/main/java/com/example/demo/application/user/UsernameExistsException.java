package com.example.demo.application.user;

public class UsernameExistsException extends RuntimeException {

	public UsernameExistsException(String msg) {
		super(msg);
	}
	
}
