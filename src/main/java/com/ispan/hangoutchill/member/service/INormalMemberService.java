package com.ispan.hangoutchill.member.service;

import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.model.SecuredToken;
import org.springframework.data.domain.Page;

import javax.transaction.Transactional;
import java.util.List;

public interface INormalMemberService {
    //創造token
    void createVerificationTokenForUser(NormalMember normalMember, String token);

    NormalMember findNormalMemberById(Integer id);

    //註冊一般會員
    void registNormalMember(NormalMember nMember);

    //確定最新一筆資料有進去
    NormalMember getLatestRegister();

    //透過email找會員
    NormalMember findNormalUserByAccount(String account);

    //透過id讓會員更新基本資料
    NormalMember updateById(Integer id, String photoB64, String nickName);

    //透過Token找到member
    SecuredToken findSecuredToken(String token);

    //後臺所有會員
    List<NormalMember> findallmember(Integer pageNum);

    Page<NormalMember> findPages(Integer pageNum);

    //管理者修改會員資料
    NormalMember updateByIdForBack(Integer id);

    //管理者修改會員資料actual
    @Transactional
    NormalMember updateActByIdForBack(Integer id, NormalMember updateM);

    //管理者更改會員權限
    @Transactional
    NormalMember updateEnable(Integer id);

    //會員更改基本資料(有圖)
    NormalMember updateActByIdForMemberP(Integer id, NormalMember updateMM, String base64);


}
