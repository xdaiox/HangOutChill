package com.ispan.hangoutchill.article.controller;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.hangoutchill.article.model.Article;
import com.ispan.hangoutchill.article.model.ArticleFavorite;
import com.ispan.hangoutchill.article.service.ArticleFavoriteService;
import com.ispan.hangoutchill.article.service.ArticleService;
import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;

@Controller
public class ArticleFavoriteController {
	
	
	@Autowired 
	ArticleFavoriteService articleFavoriteService;
	
	@Autowired
	NormalMemberService nMemberService;
	
	@Autowired
	ArticleService articleService;
	
	@ResponseBody
	@GetMapping("/article/getUserName")
	public String getUserName(
			@CurrentSecurityContext(expression = "authentication") Authentication authentication) {
	    String userName = authentication.getName();
	    return userName;
	}
	
	@ResponseBody
	@PostMapping("/article/addfav")
	public String addFavorite(
			@CurrentSecurityContext(expression = "authentication") Authentication authentication,
			@RequestParam("article_id") Integer article_id) {
		
		String name = authentication.getName();
		
		
		NormalMember currentmember = nMemberService.findNormalUserByAccount(name);
		Article currentarticle = articleService.findArticleById(article_id);
		
		ArticleFavorite artfav = new ArticleFavorite();
		artfav.setNormalmember(currentmember);
		artfav.setArticle(currentarticle);
		
		articleFavoriteService.addFavorite(artfav);
		
		return "成功加入收藏！";
	}
	
	@ResponseBody
	@DeleteMapping("/article/deletefav")
	public String deleteFavorite(
			@CurrentSecurityContext(expression = "authentication") Authentication authentication,
			@RequestParam("article_id") Integer article_id) {
		
		String name = authentication.getName();
		NormalMember currentmember = nMemberService.findNormalUserByAccount(name);
		Integer member_id = currentmember.getId();

		articleFavoriteService.deleteFavorite(member_id, article_id);
		
		return "成功移除收藏！";
	}
	
	@GetMapping("/article/allfavs")
	public String showAllUserFavs(
			@CurrentSecurityContext(expression = "authentication") Authentication authentication, Model model) {
		
		String name = authentication.getName();
		NormalMember result = nMemberService.findNormalUserByAccount(name);
		Integer member_id = result.getId();
		
		System.out.println("--------------------------");
		System.out.println(member_id);
		
		List<ArticleFavorite> artfavs = articleFavoriteService.findArticleIdByMemberId(member_id);
		
		System.out.println("--------------------------");
		System.out.println(artfavs);
		
		List<Article> article = new ArrayList<>();
		for(ArticleFavorite af :artfavs) {
			Integer article_id = af.getArticle().getArticle_id();
			Article artcontent = articleService.findArticleById(article_id);
			article.add(artcontent);
		}

		
		model.addAttribute("result", result);
		model.addAttribute("article", article);
		
		return "article/articleFav";
	}
	
	
}