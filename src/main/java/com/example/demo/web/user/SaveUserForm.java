package com.example.demo.web.user;

import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class SaveUserForm {
	@NotEmpty
	private String name;
}
