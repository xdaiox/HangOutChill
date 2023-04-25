package com.ispan.hangoutchill.actandles.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.hangoutchill.actandles.dao.AALRepository;
import com.ispan.hangoutchill.actandles.model.ActivitiesandLesson;

@Service
public class AALservice {
	@Autowired
	private AALRepository aalRepository;
	
	
	public void addAAL(ActivitiesandLesson aal) {
		aalRepository.save(aal);
	}
}
