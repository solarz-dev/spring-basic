package com.example.demo.business.user;

import java.util.Optional;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long>{

	Optional<Role> findByName(String name);

	@Query("SELECT r FROM Role r WHERE r.name in (:roles)")
	Set<Role> findAllByName(@Param("roles") Set<String> roles);

}
