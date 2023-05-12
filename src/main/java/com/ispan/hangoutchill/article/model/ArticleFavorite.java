package com.ispan.hangoutchill.article.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ispan.hangoutchill.member.model.NormalMember;

@Entity
@Table(name = "ArticleFavorite")
public class ArticleFavorite {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "favorite_id")
	private Integer favorite_id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="member_id")
	private NormalMember normalmember;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="article_id")
	private Article article;
	
	@Column(name = "favorite_count")
	private Integer favorite_count;
	
	
	public Integer getFavorite_id() {
		return favorite_id;
	}


	public void setFavorite_id(Integer favorite_id) {
		this.favorite_id = favorite_id;
	}


	public NormalMember getNormalmember() {
		return normalmember;
	}


	public void setNormalmember(NormalMember normalmember) {
		this.normalmember = normalmember;
	}


	public Article getArticle() {
		return article;
	}


	public void setArticle(Article article) {
		this.article = article;
	}


	public Integer getFavorite_count() {
		return favorite_count;
	}


	public void setFavorite_count(Integer favorite_count) {
		this.favorite_count = favorite_count;
	}


	
}