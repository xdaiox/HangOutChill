package com.ispan.hangoutchill.article.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.hangoutchill.article.dao.ArticlePictureRespository;
import com.ispan.hangoutchill.article.model.ArticlePicture;

@Service
public class ArticlePictureService {
	
	@Autowired
	private ArticlePictureRespository articlePictureRespository;
	
	
	public List<ArticlePicture> findArticlePictureById(Integer article_id) {
		return articlePictureRespository.findArticlePictureById(article_id);
	}
	
	public void deletePictureAll(List<ArticlePicture> deleteAll) {
		articlePictureRespository.deleteAll(deleteAll);
	}
	
}