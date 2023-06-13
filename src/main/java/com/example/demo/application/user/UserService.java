package com.example.demo.application.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.business.user.RoleRepository;
import com.example.demo.business.user.UserAccount;
import com.example.demo.business.user.UserRepository;
import com.example.demo.web.user.SaveUserForm;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	public UserAccount save(SaveUserForm form) {
		var user = new UserAccount();
		user.setName(form.getName());
		return userRepository.save(user);
	}
	
	public Optional<UserAccount> getById(long id) {
		return userRepository.findById(id);
	}
	
	public List<UserAccount> getAllByRoleName(String name) {
		var role = roleRepository.findByName(name);
		if (role.isPresent()) {			
			return userRepository.findAllByRoles(role.get());
		}
		return new ArrayList<>();
	}
	
}
