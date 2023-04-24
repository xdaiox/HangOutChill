package com.ispan.hangoutchill.actandles.controller;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.servlet.http.Part;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AALcontroller {
	
	@Id
	@Column(name="id")
	private String id;
	
	@Column(name="shop_Id")
	private int shop_Id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="aalContent")
	private String aalContent;
	
	@Column(name="topic")
	private String topic;
	
	@Column(name="theDayofSubmission")
	private Date theDayofSubmission;
	
	@Column(name="theDayofStarts")
	private Date theDayofStarts;
	
	@Column(name="fee")
	private int fee;
	
	@Column(name="quota")
	private int quota;
	
	@Column(name="lowerLimit")
	private int lowerLimit;
	
	@Column(name="deadLine")
	private Date deadLine;
	
	@Column(name="currentStatus")
	private String currentStatus;
	
	@Column(name="image")
	private byte[] image;
	
	@Transient
	private Part imageConverter;
}
