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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.hangoutchill.article.model.Article;
import com.ispan.hangoutchill.article.model.ArticleFavorite;
import com.ispan.hangoutchill.article.model.ArticlePicture;
import com.ispan.hangoutchill.article.service.ArticleFavoriteService;
import com.ispan.hangoutchill.article.service.ArticlePictureService;
import com.ispan.hangoutchill.article.service.ArticleService;
import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;

@Controller
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private ArticlePictureService articlePictureService;
	
	@Autowired
	private ArticleFavoriteService articleFavoriteService;
	
	@Autowired 
	NormalMemberService normalMemberService;
	
	
	
	@GetMapping("/article/articleAttention")
	public String articleAttention(@CurrentSecurityContext(expression = "authentication")Authentication authentication, Model model) {
		
		String name = authentication.getName();
        NormalMember result = normalMemberService.findNormalUserByAccount(name);
		model.addAttribute("result", result);
		
		return "article/articleAttention";
	}
	
	@GetMapping("/article/articleForm")
	public String articleForm(@CurrentSecurityContext(expression = "authentication")Authentication authentication, Model model) {
		
		String name = authentication.getName();
        NormalMember result = normalMemberService.findNormalUserByAccount(name);
        
		model.addAttribute("result", result);
		model.addAttribute("articles", new Article());
		
		return "article/articleForm";
	}
	
	
	@PostMapping("/article/articleForm")
	public String articleForm(
			@ModelAttribute("articles") Article article,
			@CurrentSecurityContext(expression = "authentication")Authentication authentication, Model model) {
		
		String name = authentication.getName();
        NormalMember result = normalMemberService.findNormalUserByAccount(name);
		
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
	        
	        article.setNormalmember(result);
            article.setImages(images);
            articleService.addArticle(article);
                       
            return "redirect:/article/AllArticle";
		}
		
		catch (IOException e) {
			throw new RuntimeException(e);
		}

	}
	
	

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
	public String lifeTheme(@RequestParam(name="article_theme") String article_theme, Model model,
							@CurrentSecurityContext(expression = "authentication")Authentication authentication) {
		
		String name = authentication.getName();
        NormalMember result = normalMemberService.findNormalUserByAccount(name);
		
		System.out.println(article_theme);
		List<Article> theme = articleService.findArticleByTheme(article_theme);
		model.addAttribute("theme", theme);
		model.addAttribute("article_theme", article_theme);
		model.addAttribute("result", result);
		return "article/articleTheme";
	}
	
	@GetMapping("/article/authorArticle")
	public String authorArticle(@RequestParam(name="auth_id") Integer auth_id,
			@CurrentSecurityContext(expression = "authentication")Authentication authentication, Model model) {
		
		String name = authentication.getName();
        NormalMember result = normalMemberService.findNormalUserByAccount(name);
        
        List<Article> authart = articleService.findArticleByMemberId(auth_id);
        
        NormalMember authName = normalMemberService.findNormalMemberById(auth_id);
        
        model.addAttribute("authart",authart);
        model.addAttribute("authName",authName);
        model.addAttribute("result", result);
        
        System.out.println("00000000000000000000000000000000000");
        System.out.println(authart);
		
		return "article/authArticle";
	}
	
	
	
	@GetMapping("/article/AllArticle")
	public String getAllFavorites(@CurrentSecurityContext(expression = "authentication")Authentication authentication, Model model) {
			
		String name = authentication.getName();
        NormalMember result = normalMemberService.findNormalUserByAccount(name);
        
		List<Article> article = articleService.findAllArticle();
		
		model.addAttribute("result", result);
		model.addAttribute("article", article);

		return "article/showAllArticle";
    }
	
	
	
	
	@GetMapping("/article/articleContent")
	public String showProductDetail(@RequestParam(name="article_id") Integer article_id,
									@CurrentSecurityContext(expression = "authentication")Authentication authentication, Model model) {
		
		String name = authentication.getName();
        NormalMember result = normalMemberService.findNormalUserByAccount(name);
		
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
		
		model.addAttribute("result", result);
		model.addAttribute("modifiedHtml", modifiedHtml);
		model.addAttribute("article", article);
		return "article/articleContent";
	}
	
	@ResponseBody
	@GetMapping("/article/checkFavorite")
	public String checkFavorite(@RequestParam(name="article_id") Integer article_id,
									@CurrentSecurityContext(expression = "authentication")Authentication authentication, Model model) {
		
		String name = authentication.getName();
        NormalMember result = normalMemberService.findNormalUserByAccount(name);
        Integer member_id = result.getId();
		
        ArticleFavorite isFavorite = articleFavoriteService.isFavoriteArticle(member_id, article_id);
        if(isFavorite != null) {
        	return "已收藏";
        }else {
        	return "未收藏";
        }
	}
	
}
