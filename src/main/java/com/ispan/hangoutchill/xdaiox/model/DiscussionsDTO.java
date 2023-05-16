package com.ispan.hangoutchill.xdaiox.model;

import java.util.Date;

public class DiscussionsDTO {
	private Integer m_id;
	private String photoB64;
	private String nickName;
	private Integer d_id;
	private String title;
	private String contents;
	private Date updateDate;
	
	
	
	public DiscussionsDTO() {
		
	}
	public DiscussionsDTO(Integer m_id,String photoB64,String nickName,Integer d_id,String title,String contents,Date updateDate){
		this.m_id = m_id;
		this.photoB64 = photoB64;
		this.nickName = nickName;
		this.d_id = d_id;
		this.title = title;
		this.contents = contents;
		this.updateDate = updateDate;
	}
	
	public Integer getM_id() {
		return m_id;
	}
	public void setM_id(Integer m_id) {
		this.m_id = m_id;
	}
	public String getPhotoB64() {
		return photoB64;
	}
	public void setPhotoB64(String photoB64) {
		this.photoB64 = photoB64;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Integer getD_id() {
		return d_id;
	}
	public void setD_id(Integer d_id) {
		this.d_id = d_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	
	
}
