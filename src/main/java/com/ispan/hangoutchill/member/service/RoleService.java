package com.ispan.hangoutchill.member.service;


import com.ispan.hangoutchill.member.dao.RoleRepository;
import com.ispan.hangoutchill.member.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class RoleService {

    @Autowired
    RoleRepository roleRepository;

    public Role findRoleByid(Integer id){
        Optional<Role> optionalRole = roleRepository.findById(id);
        return optionalRole.get();
    }
}
