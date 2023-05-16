package com.ispan.hangoutchill.shop.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.shop.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{
	
	@Query("from Product where category = :category")
	public List<Product> findProductsByCategory(@Param(value="category")String category);
	
	
	// 商品分類搜尋分頁
	@Query(value="from Product where category = :category",
			countQuery = "SELECT COUNT(*) FROM Product  WHERE category = :category")
	public Page<Product> findProductsByCategoryAndPage(@Param(value="category")String category, Pageable pageable);
	
	
	
	@Query("from Product where product_name like %:keyword%")
	public List<Product> findProductsByKeyWordSearch(@Param(value="keyword")String keyword);
	
	
	@Query(value="from Product where product_name like %:keyword%" ,
			 countQuery = "SELECT COUNT(*) FROM Product  WHERE product_name LIKE %:keyword%")
	public Page<Product> findProductByNameSearch(@Param(value="keyword") String keyword , Pageable pageable);
	
	@Query(value="select top(5) * from products order by product_id desc",nativeQuery=true)
	public List<Product> findLatestFiveProducts();

	
}
