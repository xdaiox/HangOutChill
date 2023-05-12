package com.ispan.hangoutchill.article.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.article.model.ArticleFavorite;

public interface ArticleFavoriteRespository extends JpaRepository<ArticleFavorite, Integer>{
	
	@Query("from ArticleFavorite where member_id = :member_id")
	public List<ArticleFavorite> findArticleFavoriteById(@Param(value="member_id") Integer member_id);
	
}