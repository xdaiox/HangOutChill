package com.ispan.hangoutchill.actandles.model;

import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

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
	    
	   @Column(name = "tel")
	   private String tel;
	   
	   @Column(name = "numbers_of_people")
	   private String numbersOfPeople;
	   
	   @Temporal(TemporalType.TIMESTAMP)
		@DateTimeFormat(iso = ISO.DATE)
	   @Column(name = "date_of_signup")
	   private Date date;
	   
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




	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getNumbersOfPeople() {
		return numbersOfPeople;
	}

	public void setNumbersOfPeople(String numbersOfPeople) {
		this.numbersOfPeople = numbersOfPeople;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	

}


