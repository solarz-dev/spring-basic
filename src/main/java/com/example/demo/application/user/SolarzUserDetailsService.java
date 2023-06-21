package com.example.demo.application.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.infra.UserPrincipal;

@Service
public class SolarzUserDetailsService implements UserDetailsService {
	@Autowired
	private UserService userService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		var user = userService.getByUsernameForLogin(username);
		if (user.isPresent())
			return new UserPrincipal(user.get());
		throw new UsernameNotFoundException("Usuário não encontrado");
	}
}
