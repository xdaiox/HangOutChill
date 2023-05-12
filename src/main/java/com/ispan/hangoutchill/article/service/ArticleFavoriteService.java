package com.ispan.hangoutchill.article.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.hangoutchill.article.dao.ArticleFavoriteRespository;
import com.ispan.hangoutchill.article.model.ArticleFavorite;

@Service
public class ArticleFavoriteService {
	
	@Autowired
	private ArticleFavoriteRespository articleFavoriteRespository;
	
	public void addFavorite(ArticleFavorite artfav) {
		articleFavoriteRespository.save(artfav);
	}
	
	public void deleteFavorite(Integer id) {
		articleFavoriteRespository.deleteById(id);
	}
}