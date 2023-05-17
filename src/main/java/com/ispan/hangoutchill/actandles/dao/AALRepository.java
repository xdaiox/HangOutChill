package com.ispan.hangoutchill.actandles.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.actandles.model.ActivitiesandLesson;
import com.ispan.hangoutchill.member.model.NormalMember;

public interface AALRepository extends JpaRepository<ActivitiesandLesson, Integer> {

	
	//找使用者已報名資料
	public Page<ActivitiesandLesson> findByaccountsId(Integer id,Pageable pageable);
	
	//找指定商家會員的開放報名活動
	@Query("select a from ActivitiesandLesson a where a.normalMember.id = :memberId and currentStatus = 'opened'")
	public List<ActivitiesandLesson> findIDByMemberIdAndOpened(@Param(value="memberId") Integer id);
	
	//指定商家ID搜尋
	@Query("select a from ActivitiesandLesson a where a.normalMember.id = :memberId")
	public Page<ActivitiesandLesson> findPageByMemberId(@Param(value="memberId") Integer id,Pageable pageable);
	
	@Query("select a from ActivitiesandLesson a where topic = :value")
	public Page<ActivitiesandLesson> findPageByTopic(@Param(value="value") String value,Pageable pageable);
	
	@Query("select a from ActivitiesandLesson a where topic = :value and (currentStatus = 'approved' or currentStatus = 'opened')")
	public Page<ActivitiesandLesson> findPageByTopicforguest(@Param(value="value") String value,Pageable pageable);

//	@Query("select a from ActivitiesandLesson a where currentStatus = 'unreviewed'")
//	public Page<ActivitiesandLesson> findPageByStatusForAdmin(Pageable pageable);
	
	@Query("select a from ActivitiesandLesson a where currentStatus = 'approved' or currentStatus = 'opened'")
	public Page<ActivitiesandLesson> findPageByStatusForGuest(Pageable pageable);
	
	@Query("select a from ActivitiesandLesson a where currentStatus = :value")
	public Page<ActivitiesandLesson> findPageByStatus(@Param(value="value") String value,Pageable pageable);
	

	@Query("SELECT COUNT(*) FROM LessonSignUpDetail  WHERE activitiesandLesson.id = :lesid AND normalMember.id = :memberid")
	public Integer findSignUpDetail(@Param(value ="lesid") Integer lesid , @Param(value = "memberid") Integer memberid);
	
	@Query("SELECT COUNT(*) FROM LessonSignUpDetail  WHERE activitiesandLesson.id = :lesid")
	public Integer findregistered(@Param(value ="lesid") Integer lesid );
	
	//找最新的前三筆資料
	@Query(value = "SELECT * FROM ActivitiesandLesson ORDER BY theDayofSubmission DESC LIMIT 3", nativeQuery = true)
	public List<ActivitiesandLesson> findLastest();
	//找活動
	@Query(value = "SELECT * FROM ActivitiesandLesson where topic ='act'", nativeQuery = true)
	public List<ActivitiesandLesson> findTheMostPopularAct();

}
