package com.ispan.hangoutchill.location.model;

import javax.persistence.*;


@Entity
@Table(name="locationComment")
public class LocationComment {

	@Id
    @Column(name = "comment_id")
    private Integer cmtID;

    @Column(name = "comment_rating")
    private String cmtRating;
    @Column(name = "comment_title")
    private String cmtTitle;
    @Column(name = "comment_content")
    private String cmtContent;
    @Column(name="comment_time")
    private String cmtUpdateTime;

	//關聯 與LocationInfo
	@ManyToOne(fetch=FetchType.LAZY,cascade = CascadeType.ALL)
	@JoinColumn(name="location_id")
	private LocationInfo locationInfo;





	//參數建構子
	public LocationComment(){}




	public Integer getCmtID() {
		return cmtID;
	}

	public void setCmtID(Integer cmtID) {
		this.cmtID = cmtID;
	}

	public String getCmtRating() {
		return cmtRating;
	}

	public void setCmtRating(String cmtRating) {
		this.cmtRating = cmtRating;
	}

	public String getCmtTitle() {
		return cmtTitle;
	}

	public void setCmtTitle(String cmtTitle) {
		this.cmtTitle = cmtTitle;
	}

	public String getCmtContent() {
		return cmtContent;
	}

	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}

	public String getCmtUpdateTime() {
		return cmtUpdateTime;
	}

	public void setCmtUpdateTime(String cmtUpdateTime) {
		this.cmtUpdateTime = cmtUpdateTime;
	}

	public LocationInfo getLocationInfo() {
		return locationInfo;
	}

	public void setLocationInfo(LocationInfo locationInfo) {
		this.locationInfo = locationInfo;
	}
}
