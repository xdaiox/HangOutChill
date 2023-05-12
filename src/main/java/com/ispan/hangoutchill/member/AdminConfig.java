//package com.ispan.hangoutchill.member;
//
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.core.annotation.Order;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
//import org.springframework.security.config.annotation.ObjectPostProcessor;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.provisioning.InMemoryUserDetailsManager;
//import org.springframework.security.web.SecurityFilterChain;
//
//@Configuration
//@EnableWebSecurity
//@Order(1)
//public class AdminConfig {
//
//    @Bean
//    public AuthenticationManager authManagerAdmin(HttpSecurity http) throws Exception {
//        return http.getSharedObject(AuthenticationManagerBuilder.class)
//                .authenticationProvider(authProvider2())
//                .build();
//    }
//
//    @Bean
//    public SecurityFilterChain filterChainAdmin(HttpSecurity http) throws Exception {
//        http.csrf().disable()
//                .authorizeRequests()
//                .antMatchers("/dashboard").hasAuthority("ADMIN")
//                .and()
//                .formLogin().loginPage("/member/login")
//                .defaultSuccessUrl("/back/members").and()
//                .logout().deleteCookies("JSESSIONID");
//        return http.build();
//    }
//
//    @Bean
//    public static PasswordEncoder adminEncoder() {
//        return new BCryptPasswordEncoder();
//    }
//
//    @Bean
//    public UserDetailsService userDetailsService() {
//        UserDetails user = User.withUsername("admin")
//                .password(adminEncoder().encode("admin"))
//                .roles("ADMIN")
//                .build();
//        return new InMemoryUserDetailsManager(user);
//    }
//
//    @Bean
//    public DaoAuthenticationProvider authProvider2() {
//        DaoAuthenticationProvider authProvider2 = new DaoAuthenticationProvider();
//        authProvider2.setUserDetailsService(userDetailsService());
//        authProvider2.setPasswordEncoder(adminEncoder());
//        return authProvider2;
//    }
//
//
//}
