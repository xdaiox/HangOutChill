package com.ispan.hangoutchill.member.Handler;

import com.ispan.hangoutchill.member.HangoutOauth2User;
import com.ispan.hangoutchill.member.OauthService;
import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.model.Role;
import com.ispan.hangoutchill.member.service.NormalMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Component
public class Oauth2LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    private NormalMemberService normalMemberService;

    private OauthService oauthService;

    @Lazy
    @Autowired
    private AuthenticationManager authenticationManager;

    public Oauth2LoginSuccessHandler(  OauthService oauthService) {

        this.oauthService= oauthService;

    }

    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)throws ServletException, IOException {
        HangoutOauth2User hangoutOauth2User = (HangoutOauth2User) authentication.getPrincipal();
        String account = hangoutOauth2User.getEmail();
        String name = hangoutOauth2User.getName();
        NormalMember userByEmail = oauthService.findUserByEmail(account);
        if(userByEmail == null){
            NormalMember normalMember = oauthService.saveNewUser(account,name);
            System.out.println("沒抓到");
        }else {
            authentication.setAuthenticated(true);
        }

        response.sendRedirect("/hangoutchill/member/NormalMemberDetail");
    }

}
