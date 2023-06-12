package com.example.demo.web.test;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Positive;

import lombok.Data;

@Data
public class MyForm {
	@NotEmpty
	private String name;
	@Positive
	private int age;
}
