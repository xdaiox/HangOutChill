package com.ispan.hangoutchill.shop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.hangoutchill.shop.dao.ProductPhotoRepository;
import com.ispan.hangoutchill.shop.model.ProductPhoto;
import com.ispan.hangoutchill.shop.model.ProductPhotoPK;


@Service
public class ProductPhotoService {

	private ProductPhotoRepository productPhotoRepository;
	
	@Autowired
	public ProductPhotoService(ProductPhotoRepository productPhotoRepository) {
		this.productPhotoRepository = productPhotoRepository;
	}

	public List<ProductPhoto> findAllExtraPhotos() {
		return productPhotoRepository.findAll();
	}
	
	public List<ProductPhoto> findPhotosById(Integer ProductId){
		return productPhotoRepository.findPhotosById(ProductId);
	}
	
	
	public ProductPhoto findById(ProductPhotoPK porductPhotoPK) {
		Optional<ProductPhoto> photo = productPhotoRepository.findById(porductPhotoPK);
		if(photo.isEmpty()) {
			return null;
		}
		return photo.get();
	}

	
	
	
}
