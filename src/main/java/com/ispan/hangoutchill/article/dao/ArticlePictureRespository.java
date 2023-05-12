package com.ispan.hangoutchill.article.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.article.model.ArticlePicture;

public interface ArticlePictureRespository extends JpaRepository<ArticlePicture, Integer>{
	
	@Query("from ArticlePicture where article_id = :article_id")
	public List<ArticlePicture> findArticlePictureById(@Param(value="article_id") Integer article_id);
	
}
