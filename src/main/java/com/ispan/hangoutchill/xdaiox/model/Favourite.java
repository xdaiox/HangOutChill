package com.ispan.hangoutchill.xdaiox.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.ispan.hangoutchill.member.model.NormalMember;

@Entity
@Table(name="discussionFavourite")
public class Favourite {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="favourite_id")
	private Integer id;
	
	@ManyToOne
    @JoinColumn(name="fk_member_id", nullable = true)
    private NormalMember normalMember;
	
	
    @ManyToOne
    @JoinColumn(name="fk_discussion_id", nullable = true)
    private Discussions discussions;
    
	@Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name="addedTime")
    private Date postDate;
    
    @PrePersist
    public void onCreate() {
        if(postDate == null) {
        	postDate = new Date();
        }
    }


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public NormalMember getNormalMember() {
		return normalMember;
	}

	public void setNormalMember(NormalMember normalMember) {
		this.normalMember = normalMember;
	}

	public Discussions getDiscussions() {
		return discussions;
	}

	public void setDiscussions(Discussions discussions) {
		this.discussions = discussions;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	
    
    
    
}
