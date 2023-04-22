package com.ispan.hangoutchill.member.dao;

import com.ispan.hangoutchill.member.model.NormalMember;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NormalMemberRepository extends JpaRepository<NormalMember,Integer> {


    public NormalMember findFirstByOrderByAddedTimeDesc();
}
