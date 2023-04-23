package com.ispan.hangoutchill.shop.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.hangoutchill.shop.model.ProductPhoto;
import com.ispan.hangoutchill.shop.model.ProductPhotoPK;

public interface ProductPhotoRepository extends JpaRepository<ProductPhoto, ProductPhotoPK> {

}
