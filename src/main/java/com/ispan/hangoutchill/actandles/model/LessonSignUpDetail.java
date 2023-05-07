package com.ispan.hangoutchill.actandles.model;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import com.ispan.hangoutchill.member.model.NormalMember;

@Entity
@Table(name = "lessonSignUpDetail")
public class LessonSignUpDetail {
	 @EmbeddedId
	    private LessonSignUpDetailId id;
	    
	    @ManyToOne
	    @MapsId("lesId")
	    @JoinColumn(name = "les_id")
	    private ActivitiesandLesson activitiesandLesson;
	    
	    @ManyToOne
	    @MapsId("accountId")
	    @JoinColumn(name = "account_id")
	    private NormalMember normalMember;
	    

}


