package com.ispan.hangoutchill.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		return "shop/showProducts";
	}
	
	// 後台顯示所有產品清單
	
	@GetMapping("/shop/allproducts")
	public String goShowProducts(
			@RequestParam(name="p", defaultValue="1") Integer pageNum,Model model) {
		Page<Product> page = productService.findByPage(pageNum);
		model.addAttribute("page", page);
		return "shop/showProducts";
	}
	
	
	
	
}
