package com.ispan.hangoutchill.member.config;



import com.ispan.hangoutchill.member.Handler.Oauth2LoginSuccessHandler;
import com.ispan.hangoutchill.member.UserDetailServiceImpl;

//import com.ispan.hangoutchill.member.oauth2.HangoutOauth2UserService;
import com.ispan.hangoutchill.member.oauth2.HangoutOauth2UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;


@Configuration
@EnableWebSecurity
public class UserConfig {

    @Autowired
    UserDetailServiceImpl userDetail;

    private HangoutOauth2UserService oauth2UserService;

    @Autowired
    private Oauth2LoginSuccessHandler oauth2LoginSuccessHandler;
    

    @Autowired
    public UserConfig(UserDetailServiceImpl userDetail,  HangoutOauth2UserService oauth2UserService) {
        this.userDetail = userDetail;
        this.oauth2UserService = oauth2UserService;
        
    }







    @Bean
    public AuthenticationManager authManager(HttpSecurity http) throws Exception {
        return http.getSharedObject(AuthenticationManagerBuilder.class)
                .authenticationProvider(authProvider())
                .build();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

    	http.csrf().disable()
        .authorizeRequests()
            .antMatchers("/discussion/newDiscussion","/shop/shoppingCart","/shop/directbuying").hasAuthority("USER")
            .antMatchers("/location/memberLocationInfo/addPage/**").hasAuthority("LOCATION")
            .antMatchers("/dashboard","/back/**").hasAuthority("ADMIN")
            .antMatchers("/", "/member/registration", "/NormalMember/registed","/oauth/**","/member/NormalMemberDetail","/member/updateInfo").permitAll()
            .antMatchers("/discussion/allFavourite").hasAuthority("USER")
            .antMatchers("/message/post/{id}").hasAuthority("USER")
        .and()
        .logout().logoutSuccessUrl("/").deleteCookies("JSESSIONID")
        .and()
        .formLogin()
            .loginPage("/member/login")
            .defaultSuccessUrl("/member/NormalMemberDetail")
        .and()
        .oauth2Login()
            .loginPage("/member/login")
            .userInfoEndpoint()
            .userService(oauth2UserService).and().successHandler(oauth2LoginSuccessHandler);
    return http.build();



    }



    @Bean
    public PasswordEncoder encoder(){
        return  new BCryptPasswordEncoder();
    }


    public DaoAuthenticationProvider authProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetail);
        authProvider.setPasswordEncoder(encoder());
        return authProvider;
    }

    @Bean
    public RoleHierarchy roleHierarchy() {
        RoleHierarchyImpl roleHierarchy = new RoleHierarchyImpl();
        String hierarchy = "ADMIN > LOCATION > USER";
        roleHierarchy.setHierarchy(hierarchy);
        return roleHierarchy;
    }
}
