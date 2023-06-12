package com.example.demo.web.test;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.application.demo.DemoService;
import com.example.demo.business.user.UserAccount;

@RestController
public class TestController {
	@Autowired
	private DemoService demoService;
	
	@GetMapping
	public ResponseDto test(@RequestParam String name) {
		var res = new ResponseDto();
		res.setName("Edvaldo");
		return res;
	}
	@PostMapping("/test2")
	public ResponseDto test2(@RequestBody @Valid MyForm myForm) {
		var user = demoService.getUserByName(myForm);
		var res = new ResponseDto();
		res.setName(user.getName());
		res.setId(user.getId());
		return res;
	}
}
