package com.ispan.hangoutchill.actandles.model;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class LessonSignUpDetailId implements Serializable {
	private Long lesId ;
	private Long accountId;

}
