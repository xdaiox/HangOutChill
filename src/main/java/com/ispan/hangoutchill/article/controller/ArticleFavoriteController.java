package com.ispan.hangoutchill.article.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ispan.hangoutchill.article.service.ArticleFavoriteService;
import com.ispan.hangoutchill.article.service.ArticleService;
import com.ispan.hangoutchill.member.service.NormalMemberService;

@Controller
public class ArticleFavoriteController {
	
	
	@Autowired 
	ArticleFavoriteService articleFavoriteService;
	
	@Autowired
	NormalMemberService nMemberService;
	
	@Autowired
	ArticleService articleService;
	
	
//	@PostMapping("/article/addfav")
//	public String addFavorite(
//			@CurrentSecurityContext(expression = "authentication") Authentication authentication,
//			@RequestParam("member_id") Integer member_id) {
//		
//		String userName = authentication.getName();
//		NormalMember currentmember = nMemberService.findNormalMemberById(member_id);
//		
//		return "";
//	}
	
}