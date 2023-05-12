package com.ispan.hangoutchill.member.service;

import com.ispan.hangoutchill.member.dao.NormalMemberRepository;
import com.ispan.hangoutchill.member.dao.RoleRepository;
import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class OauthService {
    @Autowired
    private NormalMemberRepository normalMemberRepository;

    @Autowired
    private RoleRepository roleRepository;

    public NormalMember findUserByEmail(String email){
        NormalMember member = normalMemberRepository.findNormalMembersByAccount(email);
        return member ;
    }

    public NormalMember saveNewUser( String email, String name){
        NormalMember member = new NormalMember();
        Optional<Role> role = roleRepository.findById(1);
        Role role1 = role.get();
        member.setAccount(email);
        member.setNickName(name);
        member.setRole(role1);
        member.setEnabled(true);
        normalMemberRepository.save(member);
        return  member;
    }

}
