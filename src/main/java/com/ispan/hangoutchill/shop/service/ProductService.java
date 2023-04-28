package com.ispan.hangoutchill.shop.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		Pageable pgb = PageRequest.of(pageNum-1, 5, Sort.Direction.ASC,"productId");
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
	
	@Transactional
	public Product updateProductById(Integer productId, Product product) {
		Optional<Product> option = productRepository.findById(productId);
		if(option.isPresent()) {
			Product updateP = option.get();
			updateP.setCategory(product.getCategory());
			updateP.setProductName(product.getProductName());
			updateP.setCategory(product.getCategory());
			updateP.setProductSpec(product.getProductSpec());
			updateP.setProductDesc(product.getProductDesc());
			updateP.setUnitPrice(product.getUnitPrice());
			updateP.setLaunchdate(product.getLaunchdate());
			updateP.setDiscount(product.getDiscount());
			updateP.setCoverImage(product.getCoverImage());
			return updateP;
		}
		
		return null;
	}
	
	
}
