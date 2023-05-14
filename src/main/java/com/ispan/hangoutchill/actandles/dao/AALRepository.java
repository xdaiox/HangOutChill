package com.ispan.hangoutchill.actandles.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.actandles.model.ActivitiesandLesson;
import com.ispan.hangoutchill.member.model.NormalMember;

public interface AALRepository extends JpaRepository<ActivitiesandLesson, Integer> {

	public Page<ActivitiesandLesson> findByaccountsId(Integer id,Pageable pageable);
	
	@Query("select a from ActivitiesandLesson a where a.normalMember.id = :memberId")
	public Page<ActivitiesandLesson> findPageByMemberId(@Param(value="memberId") Integer id,Pageable pageable);
	
	
	@Query("select a from ActivitiesandLesson a where currentStatus = 'unreviewed'")
	public Page<ActivitiesandLesson> findPageByStatusForAdmin(Pageable pageable);
	
	@Query("select a from ActivitiesandLesson a where currentStatus = 'approved'")
	public Page<ActivitiesandLesson> findPageByStatusForGuest(Pageable pageable);
	
	@Query("select a from ActivitiesandLesson a where currentStatus = :value")
	public Page<ActivitiesandLesson> findPageByStatus(@Param(value="value") String value,Pageable pageable);
	

	@Query("SELECT COUNT(*) FROM LessonSignUpDetail  WHERE activitiesandLesson.id = :lesid AND normalMember.id = :memberid")
	public Integer findSignUpDetail(@Param(value ="lesid") Integer lesid , @Param(value = "memberid") Integer memberid);
	
	@Query("SELECT COUNT(*) FROM LessonSignUpDetail  WHERE activitiesandLesson.id = :lesid")
	public Integer findregistered(@Param(value ="lesid") Integer lesid );
	 

}
