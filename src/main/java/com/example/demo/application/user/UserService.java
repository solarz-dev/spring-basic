package com.example.demo.application.user;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.business.user.QUserAccount;
import com.example.demo.business.user.Role;
import com.example.demo.business.user.RoleRepository;
import com.example.demo.business.user.UserAccount;
import com.example.demo.business.user.UserAccountSimpleDto;
import com.example.demo.business.user.UserRepository;
import com.example.demo.web.user.SaveUserForm;
import com.example.demo.web.user.UserAccountDto;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQuery;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;

    @PersistenceContext
    private EntityManager entityManager;
    
    @Autowired
    private PasswordEncoder passwordEncoder;

    public UserAccount registerNewUserAccount(CreateUserAccountDto createUserAccountDto,
    		Role role) throws UsernameExistsException {
        if (usernameExist(createUserAccountDto.getUsername())) {
            throw new UsernameExistsException(
              "There is an account with that username:" + createUserAccountDto.getUsername());
        }
        var user = new UserAccount();
        user.setName(createUserAccountDto.getName());
        user.setLastName(createUserAccountDto.getLastName());
        user.setUsername(createUserAccountDto.getUsername());
        
        user.setPassword(passwordEncoder.encode(createUserAccountDto.getPassword()));
        
        user.setEmail(createUserAccountDto.getEmail());
        user.getRoles().add(role);
        return userRepository.save(user);
    }
	
	private boolean usernameExist(String username) {
		return getByUsername(username).isPresent();
	}

	public UserAccount save(SaveUserForm form) {
		var user = new UserAccount();
		user.setName(form.getName());
		return userRepository.save(user);
	}
	
	public Optional<UserAccount> getById(long id) {
		return userRepository.findById(id);
	}
	
	public Optional<UserAccountSimpleDto> getByIdWithAddress(long id) {
		return userRepository.findByIdWithAddress(id);
	}
	
	public Optional<UserAccount> getUsers(UserQueryForm userQuery) {
		JPAQuery<Void> query = new JPAQuery<>(entityManager);
		var qUserAccount = QUserAccount.userAccount;
		BooleanExpression whereClauses = null;
		if (userQuery.getName() != null) {
			whereClauses = qUserAccount.name.likeIgnoreCase(userQuery.getName());
		}
		
		if (userQuery.getRole() != null) {
			// whereClauses = qUserAccount.roles.contains(1L);
		}
		
		return Optional.empty();
	}
	
	public List<UserAccount> getAllByRoleName(String name) {
		var role = roleRepository.findByName(name);
		if (role.isPresent()) {			
			return userRepository.findAllByRoles(role.get());
		}
		return new ArrayList<>();
	}

	public Optional<UserAccount> getByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	public Optional<UserAccount> getByUsernameForLogin(String username) {
		return userRepository.findByUsernameForLogin(username);
	}
	
}
