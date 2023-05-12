package com.ispan.hangoutchill.member;

import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@Service
public class HangoutOauth2UserService extends DefaultOAuth2UserService {
    public OAuth2User loadUser(OAuth2UserRequest userRequest)
            throws OAuth2AuthenticationException{
        OAuth2User user =  super.loadUser(userRequest);
        System.out.println("有來抓資料");
        return new HangoutOauth2User(user);
    }
}
