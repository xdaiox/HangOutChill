package com.ispan.hangoutchill.actandles.model;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

import com.ispan.hangoutchill.member.model.NormalMember;

@Entity
@Table(name = "lessonSignUpDetail")
public class LessonSignUpDetail {
	 @EmbeddedId
	    private LessonSignUpDetailId id;
	    
	    @ManyToOne(fetch = FetchType.LAZY)
	    @MapsId("lesId")
	    @JoinColumn(name = "les_id")
	    private ActivitiesandLesson activitiesandLesson;
	    
	    @ManyToOne(fetch = FetchType.LAZY)
	    @MapsId("accountId")
	    @JoinColumn(name = "account_id")
	    private NormalMember normalMember;
	    
	    

	   public ActivitiesandLesson getActivitiesandLesson() {
		return activitiesandLesson;
	}

	public void setActivitiesandLesson(ActivitiesandLesson activitiesandLesson) {
		this.activitiesandLesson = activitiesandLesson;
	}

	public NormalMember getNormalMember() {
		return normalMember;
	}

	public void setNormalMember(NormalMember normalMember) {
		this.normalMember = normalMember;
	}


	public LessonSignUpDetailId getId() {
		return id;
	}

	public void setId(LessonSignUpDetailId id) {
		this.id = id;
	}


}


