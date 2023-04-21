package com.ispan.hangoutchill.member.service;

import com.ispan.hangoutchill.member.dao.NormalMemberRepository;
import com.ispan.hangoutchill.member.model.NormalMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}

