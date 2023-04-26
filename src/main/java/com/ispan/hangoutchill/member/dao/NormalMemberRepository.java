package com.ispan.hangoutchill.member.dao;

import com.ispan.hangoutchill.member.model.NormalMember;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface NormalMemberRepository extends JpaRepository<NormalMember,Integer> {

    public NormalMember findFirstByOrderByRegistTimeDesc();


    @Query(value = "from NormalMember where account= :account")
    public NormalMember findNormalMembersByAccount(@Param(value = "account")String account);

//    @Query(value = "update NormalMember set nickName=: updateNickname ,tel=:updatetel, photoB64 =:updatePhotoB64 where id=:id")
//    public  NormalMember updatePWDById(@Param( value = "password") String password ,@Param(value="id")String id);

}
