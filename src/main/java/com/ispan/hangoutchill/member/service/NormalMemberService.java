package com.ispan.hangoutchill.member.service;

import com.ispan.hangoutchill.member.dao.NormalMemberRepository;
import com.ispan.hangoutchill.member.model.NormalMember;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class NormalMemberService {
    @Autowired
    NormalMemberRepository nMemberRepository;



    public NormalMember findNormalMemberById (Integer id){
        Optional<NormalMember> option = nMemberRepository.findById(id);
        if(option.isPresent()){
            return  option.get();
        }
        return null;
    }

    //註冊一般會員
    public void registNormalMember (NormalMember nMember){
        nMemberRepository.save(nMember);
    }

    //確定最新一筆資料有進去
    public NormalMember getLatestRegister(){
        return nMemberRepository.findFirstByOrderByRegistTimeDesc();
    }

    //透過email找會員
    public NormalMember findNormalUserByAccount(String account){
       return nMemberRepository.findNormalMembersByAccount(account);
    }

    //更新會員資料



}

