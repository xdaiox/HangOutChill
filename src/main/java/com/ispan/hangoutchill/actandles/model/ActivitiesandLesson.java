package com.ispan.hangoutchill.actandles.model;



import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.servlet.http.Part;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name="ActivitiesandLesson")
public class ActivitiesandLesson {
	@Id
	@Column(name="id",columnDefinition = "nvarchar(50)",nullable = true)
	private String id;
	
	@Column(name="shop_Id",columnDefinition = "int",nullable = true)
	private int shop_Id;
	
	@Column(name="name",columnDefinition = "nvarchar(50)",nullable = true)
	private String name;
	
	@Column(name="aalContent",columnDefinition = "nvarchar(50)",nullable = true)
	private String aalContent;
	
	@Column(name="topic",columnDefinition = "nvarchar(50)",nullable = true)
	private String topic;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(iso = ISO.DATE)
	@Column(name="theDayofSubmission",columnDefinition = "datetime" )
	private Date theDayofSubmission;
	
	@PrePersist
	public void onCreate() {
		if(theDayofSubmission == null) {
			theDayofSubmission = new Date();
		}
	}
	
	@Column(name="theDayofStarts",columnDefinition = "datetime",nullable = true)
	private Date theDayofStarts;
	
	@Column(name="fee",columnDefinition = "int",nullable = true)
	private int fee;
	
	@Column(name="quota",columnDefinition = "int",nullable = true)
	private int quota;
	
	@Column(name="lowerLimit",columnDefinition = "int",nullable = true)
	private int lowerLimit;
	
	@Column(name="deadLine",columnDefinition = "datetime",nullable = true)
	private Date deadLine;
	
	@Column(name="currentStatus",columnDefinition = "nvarchar(50)",nullable = true)
	private String currentStatus;
	
	@Lob
	@Column(name="image",columnDefinition = "varbinary(MAX)")
	private byte[] image;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getShop_Id() {
		return shop_Id;
	}

	public void setShop_Id(int shop_Id) {
		this.shop_Id = shop_Id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAalContent() {
		return aalContent;
	}

	public void setAalContent(String aalContent) {
		this.aalContent = aalContent;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public Date getTheDayofSubmission() {
		return theDayofSubmission;
	}

	public void setTheDayofSubmission(Date theDayofSubmission) {
		this.theDayofSubmission = theDayofSubmission;
	}

	public Date getTheDayofStarts() {
		return theDayofStarts;
	}

	public void setTheDayofStarts(Date theDayofStarts) {
		this.theDayofStarts = theDayofStarts;
	}

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

	public int getQuota() {
		return quota;
	}

	public void setQuota(int quota) {
		this.quota = quota;
	}

	public int getLowerLimit() {
		return lowerLimit;
	}

	public void setLowerLimit(int lowerLimit) {
		this.lowerLimit = lowerLimit;
	}

	public Date getDeadLine() {
		return deadLine;
	}

	public void setDeadLine(Date deadLine) {
		this.deadLine = deadLine;
	}

	public String getCurrentStatus() {
		return currentStatus;
	}

	public void setCurrentStatus(String currentStatus) {
		this.currentStatus = currentStatus;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}
	
	
}
