package com.ispan.hangoutchill.actandles.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.hangoutchill.actandles.dao.AALRepository;
import com.ispan.hangoutchill.actandles.model.ActivitiesandLesson;
import com.ispan.hangoutchill.actandles.model.LessonSignUpDetail;
import com.ispan.hangoutchill.actandles.model.LessonSignUpDetailId;
import com.ispan.hangoutchill.member.dao.NormalMemberRepository;
import com.ispan.hangoutchill.member.model.NormalMember;

@Service
public class LessonSignUpDetailService {

	@Autowired
	private NormalMemberRepository normalMemberRepository;
	@Autowired
	private AALRepository aalRepository;

	public void saveles(ActivitiesandLesson aal, Integer accountsId, String numbersOfPeople, String tel) {
		
		Optional<NormalMember> accountOpt = normalMemberRepository.findById(accountsId);
	    NormalMember account = accountOpt.orElseThrow(() -> new IllegalArgumentException("Invalid account ID"));
	    

	    LessonSignUpDetailId id = new LessonSignUpDetailId(aal.getId(), accountsId);
	    LessonSignUpDetail lessonSignUpDetail = new LessonSignUpDetail();
	    lessonSignUpDetail.setId(id);
	    lessonSignUpDetail.setActivitiesandLesson(aal);
	    lessonSignUpDetail.setNormalMember(account);
	    lessonSignUpDetail.setTel(tel);
	    lessonSignUpDetail.setNumbersOfPeople(numbersOfPeople);


	    aal.getLessonSignUpDetails().add(lessonSignUpDetail);
	    aalRepository.save(aal);

//		List<NormalMember> members = new ArrayList<>(aal.getAccounts());
//		Optional<NormalMember> accounts = normalMemberRepository.findById(accountsId);
//		members.add(accounts.get());
//		aal.setAccounts(members);
//		List<LessonSignUpDetail> lessonSignUpDetails = new ArrayList<>();
//		LessonSignUpDetail lessonSignUpDetail = new LessonSignUpDetail();
//		lessonSignUpDetail.setDate(LocalDateTime.now());
//		lessonSignUpDetail.setNumbersOfPeople(numbersOfPeople);
//		lessonSignUpDetail.setTel(tel);
//		lessonSignUpDetail.setActivitiesandLesson(aal);
//		lessonSignUpDetails.add(lessonSignUpDetail);
//		aal.setLessonSignUpDetails(lessonSignUpDetails);
//		aalRepository.save(aal);
	}

	public void cancalById(ActivitiesandLesson aal, Integer accountsId) {
		List<NormalMember> members = aal.getAccounts();
		Optional<NormalMember> accounts = normalMemberRepository.findById(accountsId);
		accounts.ifPresent(members::remove);

		aal.setAccounts(members);
		aalRepository.save(aal);
	}

}
