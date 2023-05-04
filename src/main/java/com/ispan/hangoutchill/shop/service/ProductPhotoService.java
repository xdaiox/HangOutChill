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
	
	public List<ProductPhoto> findPhotosById(Integer productId){
		return productPhotoRepository.findPhotosById(productId);
	}
	
	
	public ProductPhoto findById(Integer productId) {
		Optional<ProductPhoto> photo = productPhotoRepository.findById(productId);
		if(photo.isEmpty()) {
			return null;
		}
		return photo.get();
	}

	public List<Integer> findPhotosIdByProductId(Integer productId){
		
		return productPhotoRepository.findPhotosIdByProductId(productId);
	}
	
	
	public Integer deltePhotoByPhotoId(Integer photoId) {
		return productPhotoRepository.deletePhotoByPhotoId(photoId);
	}
	
	
	public void addProducPhoto(ProductPhoto productPhoto) {
		productPhotoRepository.save(productPhoto);
	}
}
