package com.ispan.hangoutchill.article.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ispan.hangoutchill.article.service.ArticleService;

@Controller
public class IndexController {
	
	
	@Autowired
	private ArticleService articleService;
}