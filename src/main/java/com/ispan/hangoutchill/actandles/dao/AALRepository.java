package com.ispan.hangoutchill.actandles.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.actandles.model.ActivitiesandLesson;
import com.ispan.hangoutchill.member.model.NormalMember;

public interface AALRepository extends JpaRepository<ActivitiesandLesson, Integer> {

	@Query("select a from ActivitiesandLesson a where a.normalMember.id = :memberId")
	public Page<ActivitiesandLesson> findPageByMemberId(@Param(value="memberId") Integer id,Pageable pageable);
	
	public Page<ActivitiesandLesson> findByaccountsId(Integer id,Pageable pageable);

	 
}
