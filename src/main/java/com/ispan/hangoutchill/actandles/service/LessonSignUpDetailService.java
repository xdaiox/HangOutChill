package com.ispan.hangoutchill.actandles.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.hangoutchill.actandles.dao.AALRepository;
import com.ispan.hangoutchill.actandles.model.ActivitiesandLesson;
import com.ispan.hangoutchill.member.dao.NormalMemberRepository;
import com.ispan.hangoutchill.member.model.NormalMember;

@Service
public class LessonSignUpDetailService {

	@Autowired
	private NormalMemberRepository normalMemberRepository;
	@Autowired
	private AALRepository aalRepository;

	public void saveles(ActivitiesandLesson aal, Integer accountsId) {

		List<NormalMember> members = new ArrayList<>(aal.getAccounts());
		Optional<NormalMember> accounts = normalMemberRepository.findById(accountsId);
		members.add(accounts.get());
		aal.setAccounts(members);

		aalRepository.save(aal);
	}

	public void cancalById(ActivitiesandLesson aal, Integer accountsId) {
		List<NormalMember> members = aal.getAccounts();
		Optional<NormalMember> accounts = normalMemberRepository.findById(accountsId);
		accounts.ifPresent(members::remove);

		aal.setAccounts(members);
		aalRepository.save(aal);
	}

}
