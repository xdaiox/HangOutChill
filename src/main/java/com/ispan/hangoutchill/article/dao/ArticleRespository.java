package com.ispan.hangoutchill.article.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.article.model.Article;
import com.ispan.hangoutchill.shop.model.Product;

public interface ArticleRespository extends JpaRepository<Article, Integer>{
	
	@Query("from Article where article_theme = :article_theme")
	public List<Article> findArticleByTheme(@Param(value="article_theme")String article_theme);
	
	@Query("from Article where status = :status")
	public List<Article> findArticleByStatus(@Param(value="status")boolean status);
	
	@Query("from Article where member_id = :member_id")
	public List<Article> findArticleByMemberId(@Param(value="member_id")Integer member_id);
	
	@Query(value="select top(3) * from Article where status =1 order by article_id desc",nativeQuery=true)
	public List<Article> findLatestThreeArticle();
	
}
