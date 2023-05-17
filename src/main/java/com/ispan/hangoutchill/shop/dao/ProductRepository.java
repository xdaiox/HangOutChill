package com.ispan.hangoutchill.shop.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.shop.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{
	
	@Query("from Product where category = :category and launched_state =1")
	public List<Product> findProductsByCategory(@Param(value="category")String category);
	
	
	// 商品分類搜尋分頁 -- 前台
	@Query(value="from Product where category = :category and launched_state =1",
			countQuery = "SELECT COUNT(*) FROM Product  WHERE category = :category and launched_state =1")
	public Page<Product> findProductsByCategoryAndPage(@Param(value="category")String category, Pageable pageable);
	
	// 全部上架商品搜尋
	@Query(value="from Product where launched_state =1",
			countQuery = "SELECT COUNT(*) FROM Product  WHERE launched_state =1")
	public Page<Product> findAllLaunchedProductsAndPage(Pageable pageable);
	
	
	// 商品分類搜尋分頁 -- 後台
	@Query(value="from Product where category = :category",
			countQuery = "SELECT COUNT(*) FROM Product  WHERE category = :category")
	public Page<Product> findProductsByCategoryAndPageBeckEnd(@Param(value="category")String category, Pageable pageable);
	
	
	// 產品搜尋 -- 未分頁
	@Query("from Product where product_name like %:keyword%")
	public List<Product> findProductsByKeyWordSearch(@Param(value="keyword")String keyword);

		
	
	// 前台產品搜尋
	@Query(value="from Product where product_name like %:keyword% and launched_state =1" ,
			 countQuery = "SELECT COUNT(*) FROM Product  WHERE product_name LIKE %:keyword% and launched_state =1")
	public Page<Product> findProductByNameSearch(@Param(value="keyword") String keyword , Pageable pageable);
	
	
	// 後台產品搜尋
		@Query(value="from Product where product_name like %:keyword%" ,
				 countQuery = "SELECT COUNT(*) FROM Product  WHERE product_name LIKE %:keyword%")
		public Page<Product> findProductByNameSearchBeckEnd(@Param(value="keyword") String keyword , Pageable pageable);
	
		
	// 前台產品廣告倫播
	@Query(value="select top(5) * from products where launched_state =1 order by product_id desc",nativeQuery=true)
	public List<Product> findLatestFiveProducts();

	
}
