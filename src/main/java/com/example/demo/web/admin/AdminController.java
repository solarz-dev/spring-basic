package com.example.demo.web.admin;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AdminController {
	@GetMapping("/admin/test")
	String testAuthority() {
		return "Success";
	}
}
