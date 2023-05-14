package com.ispan.hangoutchill.article.dao;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.article.model.ArticleFavorite;

public interface ArticleFavoriteRespository extends JpaRepository<ArticleFavorite, Integer>{
	
	@Query("from ArticleFavorite where member_id = :member_id AND article_id = :article_id")
	public ArticleFavorite findByMemberIdAndArticleId(@Param(value="member_id") Integer member_id, @Param("article_id") Integer article_id);
	
	
	@Transactional
	@Modifying
    @Query("DELETE FROM ArticleFavorite WHERE member_id = :member_id AND article_id = :article_id")
    public void deleteByMemberIdAndArticleId(@Param("member_id") Integer member_id, @Param("article_id") Integer article_id);
	
}