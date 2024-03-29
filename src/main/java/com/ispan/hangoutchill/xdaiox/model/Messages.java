package com.ispan.hangoutchill.xdaiox.model;

import java.util.Date;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ispan.hangoutchill.member.model.NormalMember;

@Entity
@Table(name="discussionMessage")
public class Messages {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="discussionMessage_id")
	private Integer dm_id;
	@Column(name="contents")
	private String contents;
	@Column(name="likes")
	private String likes;
	
	@Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name="postDate")
    private Date postDate;
	
	@Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name="updateDate")
    private Date updateDate;
	
	@Column(name="visible")
	private String visible;
	@Column(name="reportCount")
	private String reportCount;
	@Column(name="floor")
	private String floor;
	
    @PrePersist
    public void onCreate() {
        if(updateDate == null && postDate == null) {
        	postDate = new Date();
        }
        updateDate = postDate;
    }
    @PreUpdate
    	public void onUpdate() {
    	updateDate = new Date();
    }
    
    public NormalMember getNormalMmeber() {
		return normalMmeber;
	}

	public void setNormalMmeber(NormalMember normalMmeber) {
		this.normalMmeber = normalMmeber;
	}

	@ManyToOne
    @JoinColumn(name="fk_member_id", nullable = true)
	@JsonIgnore
    private NormalMember normalMmeber;
	
    @ManyToOne
    @JoinColumn(name="fk_dscussion_id", nullable = true)
	@JsonIgnore
    private Discussions discussions;

	public Integer getDm_id() {
		return dm_id;
	}

	public void setDm_id(Integer dm_id) {
		this.dm_id = dm_id;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getLikes() {
		return likes;
	}

	public void setLikes(String likes) {
		this.likes = likes;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getVisible() {
		return visible;
	}

	public void setVisible(String visible) {
		this.visible = visible;
	}

	public String getReportCount() {
		return reportCount;
	}

	public void setReportCount(String reportCount) {
		this.reportCount = reportCount;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

//	public NormalMember getNormalMmeber() {
//		return normalMmeber;
//	}
//
//	public void setNormalMmeber(NormalMember normalMmeber) {
//		this.normalMmeber = normalMmeber;
//	}

	public Discussions getDiscussions() {
		return discussions;
	}

	public void setDiscussions(Discussions discussions) {
		this.discussions = discussions;
	}
    
    
    
}
