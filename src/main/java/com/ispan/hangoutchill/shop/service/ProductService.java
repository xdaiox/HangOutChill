package com.ispan.hangoutchill.shop.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
	
	public Page<Product> findByPage(Integer pageNum){
		Pageable pgb = PageRequest.of(pageNum-1, 10, Sort.Direction.ASC,"productId");
		Page<Product> page = productRepository.findAll(pgb);
		return page;
	}
	
	
	public Product getProductById(Integer productId) {
		Optional<Product> op = productRepository.findById(productId);
		if(op.isEmpty()) {
			return null;
		}
		return op.get();
	}
	
	public void deleteProductById(Integer productId) {
		productRepository.deleteById(productId);
	}
	
	
	
	
}
