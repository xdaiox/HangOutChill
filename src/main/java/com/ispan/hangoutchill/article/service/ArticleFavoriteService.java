package com.ispan.hangoutchill.article.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.hangoutchill.article.dao.ArticleFavoriteRespository;
import com.ispan.hangoutchill.article.model.ArticleFavorite;

@Service
public class ArticleFavoriteService {
	
	@Autowired
	ArticleFavoriteRespository articleFavoriteRespository;
	
	public void addFavorite(ArticleFavorite artfav) {
		articleFavoriteRespository.save(artfav);
	}
	
	public void deleteFavorite(Integer member_id, Integer article_id) {
		articleFavoriteRespository.deleteByMemberIdAndArticleId(member_id, article_id);
	}
	
	public ArticleFavorite isFavoriteArticle(Integer member_id, Integer article_id) {
		return articleFavoriteRespository.findByMemberIdAndArticleId(member_id, article_id);
	}
}