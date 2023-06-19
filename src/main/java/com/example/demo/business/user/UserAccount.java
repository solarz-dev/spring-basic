package com.example.demo.business.user;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class UserAccount {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String name;
	private String username; // unique
    private String password;
	@OneToOne
	private Endereco endereco;
	@OneToMany(orphanRemoval = true, mappedBy = "userAccount", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<FormaDePagamento> formaDePagamento = new ArrayList<>();
	@ManyToMany(fetch = FetchType.LAZY) // many to many sempre usar Set
	private Set<Role> roles = new HashSet<>();
	private boolean enabled = true;
}