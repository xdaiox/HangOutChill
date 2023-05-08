package com.ispan.hangoutchill.actandles.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Column;
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
	    
	   @Column(name = "tel")
	   private Integer tel;
	   
	   @Column(name = "numbers_of_people")
	   private Integer numbersOfPeople;
	   
	   @Column(name = "date_of_signup")
	   private LocalDateTime date;
	   
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


	public Integer getTel() {
		return tel;
	}

	public void setTel(Integer tel) {
		this.tel = tel;
	}

	public Integer getNumbersOfPeople() {
		return numbersOfPeople;
	}

	public void setNumbersOfPeople(Integer numbersOfPeople) {
		this.numbersOfPeople = numbersOfPeople;
	}

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}
	   
}


