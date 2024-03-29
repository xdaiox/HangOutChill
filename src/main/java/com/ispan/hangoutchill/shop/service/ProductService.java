package com.ispan.hangoutchill.shop.service;

import java.util.List;
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
		Pageable pgb = PageRequest.of(pageNum-1, 5, Sort.Direction.DESC,"productId");
		Page<Product> page = productRepository.findAll(pgb);
		return page;
	}
	
	// 產品搜尋&分頁
	public Page<Product> findByNameAndPage(String keyword,Integer pageNum){
		Pageable pgb = PageRequest.of(pageNum-1, 5, Sort.Direction.DESC,"productId");
		Page<Product> page = productRepository.findProductByNameSearch(keyword, pgb);
		return page;
	}
	
	// 產品搜尋&分頁 for 前台
	public Page<Product> findByNameAndPageForFronend(String keyword,Integer pageNum){
		Pageable pgb = PageRequest.of(pageNum-1, 20, Sort.Direction.DESC,"productId");
		Page<Product> page = productRepository.findProductByNameSearch(keyword, pgb);
		return page;
	}
	
	// 全部上架產品
	public Page<Product> findAllLaunchedProduct(Integer pageNum){
		Pageable pgb = PageRequest.of(pageNum-1, 20, Sort.Direction.DESC,"productId");
		Page<Product> page = productRepository.findAllLaunchedProductsAndPage(pgb);
		return page;
	}
	
	
	
	// 產品搜尋&分頁 for 後台
	public Page<Product> findByNameAndPageForBack(String keyword,Integer pageNum){
		Pageable pgb = PageRequest.of(pageNum-1, 20, Sort.Direction.DESC,"productId");
		Page<Product> page = productRepository.findProductByNameSearchBeckEnd(keyword, pgb);
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
			updateP.setPhotos(product.getPhotos());
			updateP.setLaunchedState(product.getLaunchedState());
			return updateP;
		}
		
		return null;
	}
	
	
	public List<Product> findProductByCategory(String category){
		return productRepository.findProductsByCategory(category);
	}
	
	public Page<Product> findProductByCategoryAndPage(String category, Integer pageNum){
		Pageable page = PageRequest.of(pageNum-1, 20, Sort.Direction.DESC,"productId");
		Page<Product> pgb = productRepository.findProductsByCategoryAndPage(category, page);
		return pgb;
	}
	
	
//	public List<Product> findAllProducts(){
//		
//		return productRepository.findAll();
//	}
	
	
	public Page<Product> findAllProducts(Integer pageNum){
		Pageable page = PageRequest.of(pageNum-1, 20, Sort.Direction.DESC,"productId");
		Page<Product> pgb = productRepository.findAll(page);
		return pgb;
	}
	
	
	public List<Product> findProductsByNamekeyWord(String keyword){
		return productRepository.findProductsByKeyWordSearch(keyword);
	}
	
	public List<Product> findLatestFiveProducts(){
		return productRepository.findLatestFiveProducts();
	}
}
