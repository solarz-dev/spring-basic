package com.example.demo.business.user;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.EntityGraph;
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
	
	@Query("SELECT u.id as id, u.name as userName, ende.logradouro as logradouro "
			+ "FROM UserAccount u "
			+ "LEFT JOIN u.endereco ende "
			+ "WHERE u.id = :userId")
	Optional<UserAccountSimpleDto> findByIdWithAddress(@Param("userId") long id);

	List<UserAccount> findAllByRoles(Role role);

	Optional<UserAccount> findByUsername(String username);

	@EntityGraph(attributePaths = {"roles", "privileges"})
	@Query("SELECT u FROM UserAccount u WHERE u.username = :username")
	Optional<UserAccount> findByUsernameForLogin(@Param("username") String username);
}