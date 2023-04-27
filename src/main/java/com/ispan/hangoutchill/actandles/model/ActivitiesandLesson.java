package com.ispan.hangoutchill.actandles.model;



import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="ActivitiesandLesson")
public class ActivitiesandLesson {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id",columnDefinition = "int")
	private Integer id;
	
	@Column(name="shop_Id",columnDefinition = "int",nullable = true)
	private Integer shop_Id;
	
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
	
	@DateTimeFormat(iso = ISO.DATE)
	@Column(name="theDayofStarts",columnDefinition = "date",nullable = true)
	private Date theDayofStarts;
	
	@Column(name="fee",columnDefinition = "int",nullable = true)
	private Integer fee;
	
	@Column(name="quota",columnDefinition = "int",nullable = true)
	private Integer quota;
	
	@Column(name="lowerLimit",columnDefinition = "int",nullable = true)
	private Integer lowerLimit;
	
	@DateTimeFormat(iso = ISO.DATE)
	@Column(name="deadLine",columnDefinition = "date",nullable = true)
	private Date deadLine;
	
	@Column(name="currentStatus",columnDefinition = "nvarchar(50)",nullable = true)
	private String currentStatus;
	
	@Lob
	@Column(name="image",columnDefinition = "varbinary(MAX)")
	private byte[] image;
	
	@Transient
	private MultipartFile imageFile;

	@Transient
	private String base64image;
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getShop_Id() {
		return shop_Id;
	}

	public void setShop_Id(Integer shop_Id) {
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

	public Integer getFee() {
		return fee;
	}

	public void setFee(Integer fee) {
		this.fee = fee;
	}

	public Integer getQuota() {
		return quota;
	}

	public void setQuota(Integer quota) {
		this.quota = quota;
	}

	public Integer getLowerLimit() {
		return lowerLimit;
	}

	public void setLowerLimit(Integer lowerLimit) {
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

	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}

	public String getBase64image() {
		return base64image;
	}

	public void setBase64image(String base64image) {
		this.base64image = base64image;
	}


}
