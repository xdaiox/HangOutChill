package com.ispan.hangoutchill.actandles.model;

import java.io.Serializable;

import javax.persistence.Embeddable;

@SuppressWarnings("serial")
@Embeddable
public class LessonSignUpDetailId implements Serializable {
	private Integer lesId;
	private Integer accountId;

	public LessonSignUpDetailId() {
		// 空構造函數
	}

	public LessonSignUpDetailId(Integer lesId, Integer accountId) {
		this.lesId = lesId;
		this.accountId = accountId;
	}

	public Integer getLesId() {
		return lesId;
	}

	public void setLesId(Integer lesId) {
		this.lesId = lesId;
	}

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

}
