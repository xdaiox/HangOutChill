package com.ispan.hangoutchill.article.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan.hangoutchill.article.model.Article;
import com.ispan.hangoutchill.article.model.ArticlePicture;
import com.ispan.hangoutchill.article.service.ArticlePictureService;
import com.ispan.hangoutchill.article.service.ArticleService;

@Controller
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private ArticlePictureService articlePictureService;
	
	
	
	@GetMapping("/article/add")
	public String addArticle(Model model) {
		model.addAttribute("articles", new Article());
		return "article/dbCreateArticle";
	}
	
	@PostMapping("/article/post")
	public String postArticle(
			@ModelAttribute("articles") Article article) {

		
		try {
			//封面圖
			byte[] mainfileBytes = article.getMainImg().getBytes();
	        String mainBase64File = "data:image/png;base64,"+Base64.getEncoder().encodeToString(mainfileBytes);
	        article.setArticle_mainImg(mainBase64File);
			
	        
	        //內文圖
			Set<ArticlePicture> images = new LinkedHashSet<>();
	        
			//提取編輯器圖片base64
	        String contentHtml = article.getArticle_content();
	        Document document = Jsoup.parse(contentHtml);
	        Elements images_element = document.select("img");
	        for(Element imgele : images_element) {
	        	ArticlePicture ap = new ArticlePicture();
	        	ap.setArticle(article);
	        	String imageUrl = imgele.attr("src");
	        	String imageName = imgele.attr("data-filename");
	        	
	        	//置換base64存入src名稱，改善Article table效能
	        	imgele.attr("src", "${image.picture_url}");
	        	
	        	//將document轉回html，存入db
	        	String modifiedHtml = document.outerHtml();
	        	
	        	//遍歷html中img內的src，存入陣列，逐一存入Article_Picture table
	        	List<String> imagesbase64 = new ArrayList<>();
	        	
	        	imagesbase64.add(imageUrl);
	        	
	        	ap.setPicture_url(imagesbase64.get(0));
	        	ap.setPicture_name(imageName);
	        	article.setArticle_content(modifiedHtml);
	            images.add(ap);
	        
	        }
	        
            article.setImages(images);
            articleService.addArticle(article);
                       
            return "redirect:/article/dbShowAll";
		}
		
		catch (IOException e) {
			throw new RuntimeException(e);
		}

	}
	
	
	
	@GetMapping("/article/dbShowAll")
	public String findByPages(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model) {
		
		Page<Article> page = articleService.findByPage(pageNumber);
		
		model.addAttribute("page", page);
		
		return "article/dbShowAll";
	}
	
	
	
	@GetMapping("/article/edit")
	public String editPage(@RequestParam("article_id") Integer id,Model model) {
		Article art = articleService.findArticleById(id);
		List<ArticlePicture> pictures = articlePictureService.findArticlePictureById(id);
		String contentHtml = art.getArticle_content();
		Document document = Jsoup.parse(contentHtml);
		Elements images_element = document.select("img");
		
		for(int i = 0; i < images_element.size(); i++) {
			Element imgele = images_element.get(i);
			if (i < pictures.size()) {
				String base64file = pictures.get(i).getPicture_url();
				imgele.attr("src", base64file);
				String modifiedHtml = document.outerHtml();
				art.setArticle_content(modifiedHtml);
			}
		}
		
		
		
		model.addAttribute("articles", art);
		model.addAttribute("pictures", pictures);
		return "article/editArticlePage";
	}
	
	@PutMapping("/article/edit")
	public String putEditedMessage(@ModelAttribute("articles") Article article) {
			
			List<ArticlePicture> deleteAll = articlePictureService.findArticlePictureById(article.getArticle_id());
			articlePictureService.deletePictureAll(deleteAll);
			
			//封面圖
			
	        
	        
	        //內文圖
			Set<ArticlePicture> images = new LinkedHashSet<>();
			
			
	        
			//提取編輯器圖片base64
	        String contentHtml = article.getArticle_content();

	        
	        Document document = Jsoup.parse(contentHtml);
	        Elements images_element = document.select("img");

	        
	        for(Element imgele : images_element) {
	        	
	        	ArticlePicture ap = new ArticlePicture();
				ap.setArticle(article);
	        	

	        	
	        	String imageUrl = imgele.attr("src");
	        	String imageName = imgele.attr("data-filename");

	        	
	        	//置換base64存入src名稱，改善Article table效能
	        	imgele.attr("src", "${image.picture_url}");
	        	
	        	//將document轉回html，存入db
	        	String modifiedHtml = document.outerHtml();
	        	
	        	//遍歷html中img內的src，存入陣列，逐一存入Article_Picture table
	        	List<String> imagesbase64 = new ArrayList<>();
	        	imagesbase64.add(imageUrl);
	        	ap.setPicture_url(imagesbase64.get(0));
	        	ap.setPicture_name(imageName);
	        	article.setArticle_content(modifiedHtml);
	            images.add(ap);
	        }
				article.setImages(images);
	            articleService.updateById(article.getArticle_id(),article);
	            return "redirect:/article/dbShowAll";
	}
	
	
	@DeleteMapping("/article/delete")
	public String deleteMessage(@RequestParam Integer id) {
		articleService.deleteMessagesById(id);
		return "redirect:/article/dbShowAll";
	}
	
	
	@Transactional
	@GetMapping("article/status")
	public String editStatus(@RequestParam("article_id") Integer id, Model model) {
		Article article = articleService.findArticleById(id);
		Boolean status = article.getStatus();
		System.out.println(status);
		if(status == true) {
			article.setStatus(false);
		}
		else {
			article.setStatus(true);
		}
		System.out.println(article.getStatus());
		System.out.println("");
		return "redirect:/article/dbShowAll";
	}
	
	@GetMapping("/article/theme")
	public String lifeTheme(@RequestParam(name="article_theme") String article_theme, Model model ) {
		System.out.println(article_theme);
		List<Article> theme = articleService.findArticleByTheme(article_theme);
		model.addAttribute("theme", theme);
		model.addAttribute("article_theme", article_theme);
		return "article/articleTheme";
	}
	
	@GetMapping("/article/articleContent")
	public String showProductDetail(@RequestParam(name="article_id") Integer article_id, Model model) {
		Article article = articleService.findArticleById(article_id);
		List<ArticlePicture> pictures = articlePictureService.findArticlePictureById(article_id);
		String contentHtml = article.getArticle_content();
		Document document = Jsoup.parse(contentHtml);
		Elements images_element = document.select("img");
		
		for(int i = 0; i < images_element.size(); i++) {
			Element imgele = images_element.get(i);
			if (i < pictures.size()) {
				String base64file = pictures.get(i).getPicture_url();
				imgele.attr("src", base64file);
			}
		}
		String modifiedHtml = document.outerHtml();
		model.addAttribute("modifiedHtml", modifiedHtml);
		model.addAttribute("article", article);
		return "article/articleContent";
	}
	
}
