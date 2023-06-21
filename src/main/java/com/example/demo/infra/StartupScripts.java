package com.example.demo.infra;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import com.example.demo.application.user.CreateUserAccountDto;
import com.example.demo.application.user.UserService;
import com.example.demo.business.user.RoleRepository;

@Component
public class StartupScripts {
	@Autowired
	private UserService userService;

	@Autowired
	private RoleRepository roleRepository;

	@EventListener(ApplicationReadyEvent.class)
	public void runAfterStartup() {
		var newUser = new CreateUserAccountDto();
		newUser.setEmail("admin@solarz.com.br");
		newUser.setLastName("Silva");
		newUser.setName("Admin");
		newUser.setUsername("admin");
		newUser.setPassword("senha123");
		try {			
			userService.registerNewUserAccount(newUser, roleRepository.findByName("ADMIN").get());
		}
		catch (Exception e) {
			System.err.println(e);
		}
	}
}