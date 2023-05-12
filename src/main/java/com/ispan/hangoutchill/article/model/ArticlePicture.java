package com.ispan.hangoutchill.article.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "ArticlePicture")  
public class ArticlePicture {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "picture_id")
    private Integer picture_id;
	
	@Column(name = "picture_name", columnDefinition = "nvarchar(50)", nullable = true)
	private String picture_name;
	
	@Column(name = "picture_url", columnDefinition = "varbinary(max)", nullable = true)
	private String picture_url;
	
	@Transient
	private MultipartFile picturefile;
	
	@ManyToOne
	@JoinColumn(name="article_id", nullable = false)
	private Article article;
	
	
    public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public MultipartFile getPicturefile() {
		return picturefile;
	}

	public void setPicturefile(MultipartFile picturefile) {
		this.picturefile = picturefile;
	}

	public Integer getPicture_id() {
		return picture_id;
	}

	public void setPicture_id(Integer picture_id) {
		this.picture_id = picture_id;
	}

	public String getPicture_name() {
		return picture_name;
	}

	public void setPicture_name(String picture_name) {
		this.picture_name = picture_name;
	}

	public String getPicture_url() {
		return picture_url;
	}

	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}

	@Override
	public String toString() {
		return "ArticlePicture [picture_id=" + picture_id + ", picture_name=" + picture_name + "]";
	}

	
	
	
}
