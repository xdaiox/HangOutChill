package com.ispan.hangoutchill.article.model;

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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ispan.hangoutchill.member.model.NormalMember;

@Entity
@Table(name = "Article")  
public class Article {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "article_id")
	private Integer article_id;
	
	@Column(name = "article_name", columnDefinition = "nvarchar(30)", nullable = false)
	private String article_name;
	
	@Column(name = "article_excerpt", columnDefinition = "nvarchar(200)", nullable = true )
	private String article_excerpt;
	
	@Column(name = "article_content", columnDefinition = "text", nullable = true)
	private String article_content;
	
	@Column(name = "article_theme", columnDefinition = "nvarchar(30)", nullable = true)
	private String article_theme;
	

	
	@Column(name = "status", columnDefinition = "bit", nullable = true)
	private Boolean status;
	
	@Column(name = "article_mainImg", columnDefinition = "nvarchar(MAX)", nullable = true)
	private String article_mainImg;
	
	@Transient
    private MultipartFile mainImg;

	@OneToMany(mappedBy = "article", cascade = CascadeType.ALL)
    private Set<ArticlePicture> images = new LinkedHashSet<>();
	
	@OneToMany(mappedBy="article", cascade = CascadeType.PERSIST)
	private Set<ArticleFavorite> favorite = new LinkedHashSet<>();
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="member_id")
	private NormalMember normalmember;
	


	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss EEEE",timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "createtime", columnDefinition = "datetime")
	private Date createtime;	

	@PrePersist
	public void onCreate() {
		if(createtime == null) {
			createtime = new Date();
		}
	}
	
	
	
	public NormalMember getNormalmember() {
		return normalmember;
	}
	
	public void setNormalmember(NormalMember normalmember) {
		this.normalmember = normalmember;
	}

	public Set<ArticleFavorite> getFavorite() {
		return favorite;
	}

	public void setFavorite(Set<ArticleFavorite> favorite) {
		this.favorite = favorite;
	}

	
    public String getArticle_excerpt() {
		return article_excerpt;
	}

	public void setArticle_excerpt(String article_excerpt) {
		this.article_excerpt = article_excerpt;
	}

	public String getArticle_mainImg() {
		return article_mainImg;
	}

	public void setArticle_mainImg(String article_mainImg) {
		this.article_mainImg = article_mainImg;
	}

	public MultipartFile getMainImg() {
		return mainImg;
	}

	public void setMainImg(MultipartFile mainImg) {
		this.mainImg = mainImg;
	}
	
	public Set<ArticlePicture> getImages() {
		return images;
	}


	public void setImages(Set<ArticlePicture> images) {
		this.images = images;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}
	
	public String getArticle_theme() {
		return article_theme;
	}

	public void setArticle_theme(String article_theme) {
		this.article_theme = article_theme;
	}


	public Integer getArticle_id() {
		return article_id;
	}

	public void setArticle_id(Integer article_id) {
		this.article_id = article_id;
	}

	public String getArticle_name() {
		return article_name;
	}

	public void setArticle_name(String article_name) {
		this.article_name = article_name;
	}
	
	public String getArticle_content() {
		return article_content;
	}

	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}
	
	
}
