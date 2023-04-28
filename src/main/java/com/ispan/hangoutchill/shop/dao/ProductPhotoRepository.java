package com.ispan.hangoutchill.shop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.shop.model.ProductPhoto;
import com.ispan.hangoutchill.shop.model.ProductPhotoPK;

public interface ProductPhotoRepository extends JpaRepository<ProductPhoto, ProductPhotoPK> {

	@Query("from ProductPhoto where product_id = :productId")
	public List<ProductPhoto> findPhotosById(@Param(value="productId") Integer productId);
	
}
