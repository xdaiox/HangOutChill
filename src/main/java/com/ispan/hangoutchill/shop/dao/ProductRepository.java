package com.ispan.hangoutchill.shop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.shop.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{
	
	@Query("from Product where category = :category")
	public List<Product> findProductsByCategory(@Param(value="category")String category);
	
	
}
