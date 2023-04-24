package com.ispan.hangoutchill.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.hangoutchill.shop.dao.ProductRepository;
import com.ispan.hangoutchill.shop.model.Product;

@Service
public class ProductService {

	private ProductRepository productRepository;
	
	@Autowired
	public ProductService(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}

	
	public void addProduct(Product product) {
		productRepository.save(product);
	}
	
	
}
