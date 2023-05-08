package com.ispan.hangoutchill.xdaiox.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.ispan.hangoutchill.member.model.NormalMember;

@Entity
@Table(name="favourite")
public class Favourite {

	@ManyToOne
    @JoinColumn(name="fk_member_id", nullable = true)
    private NormalMember fnormalMmeber;
	
    @ManyToOne
    @JoinColumn(name="fk_dscussion_id", nullable = true)
    private Discussions fdiscussions;
    
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

	public NormalMember getFnormalMmeber() {
		return fnormalMmeber;
	}

	public void setFnormalMmeber(NormalMember fnormalMmeber) {
		this.fnormalMmeber = fnormalMmeber;
	}

	public Discussions getFdiscussions() {
		return fdiscussions;
	}

	public void setFdiscussions(Discussions fdiscussions) {
		this.fdiscussions = fdiscussions;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	
    
    
    
}
