package com.ispan.hangoutchill.xdaiox.model;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.ispan.hangoutchill.member.model.NormalMember;

@Entity
@Table(name="discussion")
public class Discussions {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="dscussion_id")
	private Integer d_id;
	@Column(name="type")
	private String type;
	@Column(name="title")
	private String title;
	@Column(name="contents")
	private String contents;
	@Column(name="likes")
	private String likes;
	@Column(name="favorite")
	private String favorite;
	@Column(name="readCount")
	private String readCount;
	@Column(name="shareCount")
	private String shareCount;
	
	@Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name="postDate")
    private Date postDate;
	
	@Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name="updateDate")
    private Date updateDate;
	
	@Column(name="visible")
	private boolean visible;
	@Column(name="rportCount")
	private String rportCount;
	
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
	
    public void setVisibleTrue() {
        this.visible = true;
    }
	
	@ManyToOne
	@JoinColumn(name="fk_member_id", nullable = true)
	@JsonBackReference
	private NormalMember normalMember;
	
    @OneToMany(mappedBy = "discussions",fetch=FetchType.LAZY,
	cascade = {CascadeType.PERSIST},orphanRemoval = true)
    @JsonIgnoreProperties("NormalMember")
    private Set<Messages> messages = new LinkedHashSet<>();
    
    @OneToMany(mappedBy = "discussions",fetch=FetchType.LAZY,
	cascade = {CascadeType.PERSIST},orphanRemoval = true)
    private Set<Favourite> favourite = new LinkedHashSet<>();
	
	
	
    public NormalMember getNormalMember() {
		return normalMember;
	}



	public void setNormalMember(NormalMember normalMember) {
		this.normalMember = normalMember;
	}



	public Set<Messages> getMessages() {
		return messages;
	}



	public void setMessages(Set<Messages> messages) {
		this.messages = messages;
	}

    
	public Discussions() {
	}
	
	




	public Integer getD_id() {
		return d_id;
	}



	public void setD_id(Integer d_id) {
		this.d_id = d_id;
	}


	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
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



	public String getLikes() {
		return likes;
	}



	public void setLikes(String likes) {
		this.likes = likes;
	}



	public String getFavorite() {
		return favorite;
	}



	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}



	public String getReadCount() {
		return readCount;
	}



	public void setReadCount(String readCount) {
		this.readCount = readCount;
	}



	public String getShareCount() {
		return shareCount;
	}



	public void setShareCount(String shareCount) {
		this.shareCount = shareCount;
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





	public boolean isVisible() {
		return visible;
	}



	public void setVisible(boolean visible) {
		this.visible = visible;
	}



	public String getRportCount() {
		return rportCount;
	}



	public void setRportCount(String rportCount) {
		this.rportCount = rportCount;
	}





}
