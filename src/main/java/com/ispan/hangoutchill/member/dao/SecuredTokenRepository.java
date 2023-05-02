package com.ispan.hangoutchill.member.dao;

import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.model.SecuredToken;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SecuredTokenRepository extends JpaRepository<SecuredToken, Integer> {
    SecuredToken findByToken(String token);

    SecuredToken findByNormalMember(NormalMember normalMember);
}
