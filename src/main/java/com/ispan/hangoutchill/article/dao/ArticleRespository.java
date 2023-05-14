package com.ispan.hangoutchill.article.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.article.model.Article;

public interface ArticleRespository extends JpaRepository<Article, Integer>{
	
	@Query("from Article where article_theme = :article_theme")
	public List<Article> findArticleByTheme(@Param(value="article_theme")String article_theme);
	
	@Query("from Article where status = :status")
	public List<Article> findArticleByStatus(@Param(value="status")boolean status);
	
}
