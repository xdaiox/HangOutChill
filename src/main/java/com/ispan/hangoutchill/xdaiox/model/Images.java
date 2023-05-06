package com.ispan.hangoutchill.xdaiox.model;

import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

import com.ispan.hangoutchill.member.model.NormalMember;

@Entity
@Table(name="discussionImage")
public class Images {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="Image_id")
	private Integer i_id;
	
    @ManyToOne
    @JoinColumn(name="fk_member_id", nullable = true)
    private NormalMember fkImgNormalMmeber;
	
    @ManyToOne
    @JoinColumn(name="fk_dscussion_id", nullable = true)
    private Discussions fkImgDiscussions;
	
	@Lob
	@Column(name="imageData")
    private byte[] img_data;
	
	@Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name="postDate")
    private Date postDate;
	
	@Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name="updateDate")
    private Date updateDate;
	
    @PrePersist
    public void onCreate() {
        if(postDate == null) {
        	postDate = new Date();
        }
    }

	public Images() {
	}
    
	public NormalMember getFkImgNormalMmeber() {
		return fkImgNormalMmeber;
	}

	public void setFkImgNormalMmeber(NormalMember fkImgNormalMmeber) {
		this.fkImgNormalMmeber = fkImgNormalMmeber;
	}

	public Discussions getFkImgDiscussions() {
		return fkImgDiscussions;
	}

	public void setFkImgDiscussions(Discussions fkImgDiscussions) {
		this.fkImgDiscussions = fkImgDiscussions;
	}

	public byte[] getImg_data() {
		return img_data;
	}

	public void setImg_data(byte[] img_data) {
		this.img_data = img_data;
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
    


    
    
}
