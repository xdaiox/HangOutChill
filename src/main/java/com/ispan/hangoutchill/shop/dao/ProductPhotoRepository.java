package com.ispan.hangoutchill.shop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.hangoutchill.shop.model.ProductPhoto;
import com.ispan.hangoutchill.shop.model.ProductPhotoPK;

public interface ProductPhotoRepository extends JpaRepository<ProductPhoto, Integer> {

	@Query("from ProductPhoto where product_id = :productId")
	public List<ProductPhoto> findPhotosById(@Param(value="productId") Integer productId);
	
	// 20240430 bug 原因在此
	@Query("select photoId from ProductPhoto where product_id = :productId")
	public List<Integer> findPhotosIdByProductId(@Param(value="productId") Integer productId);
	
	@Transactional
	@Modifying
	@Query("delete from ProductPhoto where photo_id = :photoId")
	public Integer deletePhotoByPhotoId(@Param(value="photoId") Integer photoId);
	
}
