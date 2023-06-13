package com.example.demo.business.user;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<UserAccount, Long>{

	@Query("SELECT u "
			+ "FROM UserAccount u "
			+ "JOIN u.roles r "
			+ "WHERE r.name = :name")
	List<UserAccount> findByAllByRoleName(@Param("name") String name);
	
	@Query(value = "SELECT * "
			+ "FROM user_account u "
			+ "JOIN user_account_roles uar ON uar.user_account_id = u.id "
			+ "JOIN role r ON uar.roles_id = r.id "
			+ "WHERE r.name = :name", nativeQuery = true)
	List<UserAccount> findAllByRoleNameNative(@Param("name") String name);

	List<UserAccount> findAllByRoles(Role role);
}