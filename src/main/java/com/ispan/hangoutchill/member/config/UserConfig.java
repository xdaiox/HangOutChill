package com.ispan.hangoutchill.member.config;



import com.ispan.hangoutchill.member.Handler.Oauth2LoginSuccessHandler;
import com.ispan.hangoutchill.member.HangoutOauth2UserService;
import com.ispan.hangoutchill.member.OauthService;
import com.ispan.hangoutchill.member.UserDetailServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;


@Configuration
@EnableWebSecurity
public class UserConfig {

    private final Oauth2LoginSuccessHandler oauth2LoginSuccessHandler;

    private HangoutOauth2UserService oauth2UserService;
    private UserDetailServiceImpl userDetail;


    @Autowired
    public UserConfig(UserDetailServiceImpl userDetail,  HangoutOauth2UserService oauth2UserService,  @Lazy  Oauth2LoginSuccessHandler oauth2LoginSuccessHandler) {
        this.userDetail = userDetail;
        this.oauth2UserService = oauth2UserService;
        this.oauth2LoginSuccessHandler = oauth2LoginSuccessHandler;
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
                .antMatchers("/discussion/newDiscussion").hasAuthority("USER")
                .antMatchers("/dashboard").hasAuthority("ADMIN")
                .antMatchers("/", "/member/registration", "/NormalMember/registed").permitAll()
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
                .userService(oauth2UserService)
                .and()
                .successHandler(oauth2LoginSuccessHandler);

        return http.build();
    }






    public DaoAuthenticationProvider authProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetail);
        authProvider.setPasswordEncoder(userDetail.encoder());
        return authProvider;
    }


    @Bean
    public RoleHierarchy roleHierarchy() {
        RoleHierarchyImpl roleHierarchy = new RoleHierarchyImpl();
        String hierarchy = "ADMIN > USER";
        roleHierarchy.setHierarchy(hierarchy);
        return roleHierarchy;
    }
}
