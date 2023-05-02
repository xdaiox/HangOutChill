package com.ispan.hangoutchill.member.service;

import com.ispan.hangoutchill.member.model.NormalMember;
import org.springframework.stereotype.Service;


public interface INormalMemberService {
    //創造token
    void createVerificationTokenForUser(NormalMember normal, String token);

    NormalMember findNormalMemberById(Integer id);

    //註冊一般會員
    void registNormalMember(NormalMember nMember);

    //確定最新一筆資料有進去
    NormalMember getLatestRegister();

    //透過email找會員
    NormalMember findNormalUserByAccount(String account);

    //透過id讓會員更新基本資料
    NormalMember updateById(Integer id, String photoB64, String nickName);
}
