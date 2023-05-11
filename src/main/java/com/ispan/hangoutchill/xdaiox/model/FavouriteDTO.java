package com.ispan.hangoutchill.xdaiox.model;

import java.util.Date;

import com.ispan.hangoutchill.member.model.NormalMember;

public class FavouriteDTO {
	private Integer id;
	private Integer normalMember;
	private Integer discussions;
	private Date postDate;
	
	 // 測試用顯示內容
    public String toString() {
        return "FavouriteDTO{" +
                "id=" + id +
                ", normalMember='" + normalMember + '\'' +
                ", discussions='" + discussions + '\'' +
                ", postDate='" + postDate + '\'' +
                '}'+"\n";
    }
	
    public FavouriteDTO() {
    }

	public FavouriteDTO(Integer id, Integer normalMember, Integer discussions, Date postDate) {
		this.id = id;
		this.normalMember = normalMember;
		this.discussions = discussions;
		this.postDate = postDate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNormalMember() {
		return normalMember;
	}

	public void setNormalMember(Integer normalMember) {
		this.normalMember = normalMember;
	}

	public Integer getDiscussions() {
		return discussions;
	}

	public void setDiscussions(Integer discussions) {
		this.discussions = discussions;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
    
	
	
    
}
