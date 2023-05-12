package com.ispan.hangoutchill.member.dao;

import com.ispan.hangoutchill.member.model.NormalMember;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NormalMemberRepository extends JpaRepository<NormalMember,Integer>, JpaSpecificationExecutor<NormalMember> {

    public NormalMember findFirstByOrderByRegistTimeDesc();


    @Query(value = "from NormalMember where account= :account")
    public NormalMember findNormalMembersByAccount(@Param(value = "account")String account);

    @Query(value = "from NormalMember where nickName= :nickName")
    public NormalMember findNormalMembersByNickName(@Param(value = "nickName")String nickName);

    @Query(value = "from NormalMember where account like '%'+:account+'%'")
    public List<NormalMember> findBlurMemberByAcoount(@Param(value = "account")String account);

    @Query(value = "SELECT  * FROM [dbo].[normalAccount] WHERE FK_role_id = 1 ", nativeQuery = true)
    public  Page<NormalMember> findAllNormalMember(Pageable pageable);

    @Query(value = "SELECT  * FROM [dbo].[normalAccount] WHERE FK_role_id = 2 ", nativeQuery = true)
    public  Page<NormalMember> findAllLocationMember(Pageable pageable);


//    @Query(value = "from NormalMember where account like '%'+:account+'%'")
//    public Page<NormalMember> findNormalMembersByAccountPage(@Param(value = "account")String account, Pageable page);

}
