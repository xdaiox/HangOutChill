package com.ispan.hangoutchill.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ispan.hangoutchill.shop.model.Product;
import com.ispan.hangoutchill.shop.service.ProductService;

@Controller
public class ProductController {

	ProductService productService;
	
	@Autowired
	public ProductController(ProductService productService) {
		this.productService = productService;
	}

	@GetMapping("/shop/add")
	public String addProduct(Model model) {
		model.addAttribute("product", new Product());
		return "shop/addProductPage";
	}
	
	@PostMapping("/shop/postProduct")
	public String postProduct(
			@ModelAttribute Product product, 
			Model model) {
		 productService.addProduct(product);
		
		return "shop/allProductManagement";
	}
	
}
