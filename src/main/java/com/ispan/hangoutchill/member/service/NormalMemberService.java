package com.ispan.hangoutchill.member.service;

import com.ispan.hangoutchill.member.dao.NormalMemberRepository;
import com.ispan.hangoutchill.member.dao.SecuredTokenRepository;
import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.model.SecuredToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class NormalMemberService implements INormalMemberService {
    @Autowired
    NormalMemberRepository nMemberRepository;

    @Autowired
    SecuredTokenRepository securedTokenRepository;

    //創造token
    @Override
    public void createVerificationTokenForUser(NormalMember normalMember, String token) {
        SecuredToken securedToken = new SecuredToken(normalMember, token);
        securedTokenRepository.save(securedToken);
    }

    @Override
    public NormalMember findNormalMemberById(Integer id) {
        Optional<NormalMember> option = nMemberRepository.findById(id);
        if (option.isPresent()) {
            return option.get();
        }
        return null;
    }

    //註冊一般會員
    @Override
    public void registNormalMember(NormalMember nMember) {
        nMemberRepository.save(nMember);
    }

    //確定最新一筆資料有進去
    @Override
    public NormalMember getLatestRegister() {
        return nMemberRepository.findFirstByOrderByRegistTimeDesc();
    }

    //透過email找會員
    @Override
    public NormalMember findNormalUserByAccount(String account) {
        return nMemberRepository.findNormalMembersByAccount(account);
    }

    //透過id讓會員更新基本資料
    @Override
    public NormalMember updateById(Integer id, String photoB64, String nickName) {
        Optional<NormalMember> byId = nMemberRepository.findById(id);
        if (byId.isPresent()) {
            NormalMember normalMember = byId.get();
            normalMember.setPhotoB64(photoB64);
            normalMember.setNickName(nickName);
            return normalMember;
        }
        return null;
    }

    //透過Token找到member
    public SecuredToken findSecuredToken(String token) {
        return securedTokenRepository.findByToken(token);
    }

    //後臺所有會員
    public List<NormalMember> findallmember(Integer pageNum) {
        Pageable pgb = PageRequest.of(pageNum - 1, 10, Sort.Direction.DESC, "registTime");
        Page<NormalMember> page = nMemberRepository.findAll(pgb);
        List<NormalMember> result = page.getContent();
        return result;

    }

    public Page<NormalMember> findPages(Integer pageNum) {
        Pageable pgb = PageRequest.of(pageNum - 1, 10, Sort.Direction.DESC, "registTime");
        Page<NormalMember> page = nMemberRepository.findAll(pgb);

        return page;
    }

    //管理者修改會員資料
    public NormalMember updateByIdForBack(Integer id) {
        Optional<NormalMember> byId = nMemberRepository.findById(id);
        NormalMember normalMember = byId.get();
        return normalMember;
    }

    public NormalMember updateActByIdForBack(Integer id, NormalMember updateM){
        Optional<NormalMember> byId = nMemberRepository.findById(id);
        if (byId.isPresent()){
            NormalMember normalMember = byId.get();
            normalMember.setAccount(updateM.getAccount());
            normalMember.setReallName(updateM.getReallName());
            normalMember.setBirthdate(updateM.getBirthdate());
            normalMember.setGender(updateM.getGender());
            nMemberRepository.save(normalMember);
            return normalMember;
        }
        return null;
    }
}

