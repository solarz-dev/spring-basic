package com.example.demo.infra;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.example.demo.business.user.UserAccount;

public class UserPrincipal implements UserDetails {

	private UserAccount userAccount;

	public UserPrincipal(UserAccount userAccount) {
		this.userAccount = userAccount;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> listaAutorizacao = new java.util.ArrayList<>();
		userAccount.getPrivileges().forEach(privilege -> {
			if (privilege != null && privilege.getName() != null)
				listaAutorizacao.add(new SimpleGrantedAuthority(privilege.getName()));
		});

		userAccount.getRoles().forEach(role -> {
			if (role != null && role.getName() != null)
				listaAutorizacao.add(new SimpleGrantedAuthority(role.getName()));
		});
		return listaAutorizacao;
	}

	@Override
	public String getPassword() {
		return userAccount.getPassword();
	}

	@Override
	public String getUsername() {
		return userAccount.getName();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return userAccount.isEnabled();
	}

}
