package com.example.demo.infra;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.www.BasicAuthenticationEntryPoint;

@Configuration
public class BasicAuthConfiguration {

    @Bean
    public SecurityFilterChain filterChainApp1(HttpSecurity http) throws Exception {
        http
        .requestMatchers()
            .antMatchers("/**")
        .and()
        .authorizeRequests()
        .anyRequest()
        .hasAnyRole("ADMIN")
        .and()
        .httpBasic()
        .authenticationEntryPoint(authenticationEntryPoint1())
        .and()
        .sessionManagement()
        .sessionCreationPolicy(SessionCreationPolicy.STATELESS);
        http.csrf().disable();
        return http.build();
    }

    @Bean
    public AuthenticationEntryPoint authenticationEntryPoint1(){
        BasicAuthenticationEntryPoint entryPoint = new BasicAuthenticationEntryPoint();
        entryPoint.setRealmName("Demo api basic auth access");
        return entryPoint;
    }

}