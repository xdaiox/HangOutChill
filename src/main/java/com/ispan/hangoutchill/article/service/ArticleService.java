package com.ispan.hangoutchill.article.service;

import java.io.IOException;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.hangoutchill.article.dao.ArticleRespository;
import com.ispan.hangoutchill.article.model.Article;

@Service
public class ArticleService {

	@Autowired
	private ArticleRespository articleRepository;
	
	
	public void addArticle(Article article) {
		articleRepository.save(article);
	}
	public Page<Article> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 5, Sort.Direction.DESC, "createtime");
		Page<Article> page = articleRepository.findAll(pgb);
		return page;
	}
    
	public Article findArticleById(Integer id) {
		Optional<Article> option = articleRepository.findById(id);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	}
	
	public List<Article> findArticleByTheme(String article_theme) {
		
		return articleRepository.findArticleByTheme(article_theme);
	}
    
	@Transactional
	public Article updateById(Integer id, Article arts) {
		Optional<Article> option = articleRepository.findById(id);
		
		if(option.isPresent()) {
			Article art = option.get();
			System.out.println("--------------------------");
			System.out.println(arts);
			
			art.setArticle_name(arts.getArticle_name());
			art.setArticle_content(arts.getArticle_content());
			art.setArticle_excerpt(arts.getArticle_excerpt());
			art.setArticle_theme(arts.getArticle_theme());
			art.setStatus(arts.getStatus());
			art.setImages(arts.getImages());
			if(!arts.getMainImg().isEmpty()) {
				try {
					byte[] mainfileBytes = arts.getMainImg().getBytes();
					String mainBase64File = "data:image/png;base64,"+Base64.getEncoder().encodeToString(mainfileBytes);
					art.setArticle_mainImg(mainBase64File);								
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return art;
		}
		return null;
	}
	
	
	public void deleteMessagesById(Integer id) {
		articleRepository.deleteById(id);
	}
	
	public List<Article> findAllArticle() {
        return articleRepository.findArticleByStatus(true);
    }
	
}
