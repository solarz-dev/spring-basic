package com.example.demo.application.demo;

import org.springframework.stereotype.Service;

import com.example.demo.business.user.UserAccount;
import com.example.demo.web.test.MyForm;

@Service
public class DemoService {
	public UserAccount getUserByName(MyForm myForm) {
		if (myForm.getName().equals("Edvaldo")) {
			var res = new UserAccount();
			res.setName("Edvaldo");
			res.setId(1);
			return res;
		}
		var res = new UserAccount();
		res.setName("Jake");
		res.setId(2);
		return res;
	}
}
