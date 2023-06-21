package com.example.demo.application.user;

import java.util.HashSet;
import java.util.Set;

import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class CreateUserAccountDto {
	@NotEmpty
	private String username;
	
	@NotEmpty
	private String email;
	
	@NotEmpty
	private String password;

	@NotEmpty
	private String name;
	
	@NotEmpty
	private String lastName;
}