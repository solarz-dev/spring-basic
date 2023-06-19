package com.example.demo.web.user;

import java.util.HashSet;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.application.user.UserService;
import com.example.demo.business.user.Role;
import com.example.demo.business.user.UserAccount;
import com.example.demo.business.user.UserAccountSimpleDto;

@RestController
public class UserAccountControlller {
	@Autowired
	private UserService userService;
	
	@PostMapping("/user")
	public UserAccountDto save(@RequestBody @Valid SaveUserForm form) {
		var userAccount = userService.save(form);
		var response = new UserAccountDto();
		response.setId(userAccount.getId());
		response.setName(userAccount.getName());
		return response;
	}
	
	@GetMapping("/user/{id}")
	public UserAccountDto getById(@PathVariable long id) {
		var userAccount = userService.getById(id);
		var response = new UserAccountDto();
		if (userAccount.isPresent()) {
			response.setId(userAccount.get().getId());
			response.setName(userAccount.get().getName());
			return response;
		}
		throw new RuntimeException("User not found");
	}
	
	@GetMapping("/user/role/{roleName}")
	public List<UserAccountDto> getByRoleName(@PathVariable String roleName) {
		var users = userService.getAllByRoleName(roleName);
		return users
				.stream()
				.map(u -> map(u))
				.toList();
	}
	
	@GetMapping("/user/findWithAdress/{userId}")
	public UserAccountSimpleDto getByIdWithAddress(@PathVariable long userId) {
		var user = userService.getByIdWithAddress(userId);
		if (user.isPresent()) {
			return user.get();
		}
		throw new RuntimeException("User not found");
	}
	
	private UserAccountDto map(UserAccount userAccount) {
		var response = new UserAccountDto();
		response.setId(userAccount.getId());
		response.setName(userAccount.getName());
		return response;
	}
}
