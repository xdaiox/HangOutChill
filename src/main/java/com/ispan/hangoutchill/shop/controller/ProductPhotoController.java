package com.ispan.hangoutchill.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ispan.hangoutchill.shop.service.ProductPhotoService;

@Controller
public class ProductPhotoController {

	private ProductPhotoService productPhotoService;
	
	@Autowired
	public ProductPhotoController(ProductPhotoService productPhotoService) {
		this.productPhotoService = productPhotoService;
	}
	
	
	
	

}
