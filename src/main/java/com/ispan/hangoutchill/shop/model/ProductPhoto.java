package com.ispan.hangoutchill.shop.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="productPhoto")
public class ProductPhoto {
	
	@EmbeddedId
	private ProductPhotoPK productPhotoPK;
	
	
	@ManyToOne(fetch=FetchType.LAZY,cascade = CascadeType.ALL)
	@MapsId("productId")
	@JoinColumn(name="product_id")
	private Product product;
	
	@Column(name="photo",columnDefinition = "varbinary(max)")
	private byte[] photo;
	
	@Transient
	private MultipartFile uploadimg;
	
	@Column(name="photo_id",columnDefinition = "int")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer photoId;
	
	
	public Integer getPhotoId() {
		return photoId;
	}


	public void setPhotoId(Integer photoId) {
		this.photoId = photoId;
	}


	public ProductPhoto() {
	}
	

	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product product) {
		this.product = product;
	}
	
	public ProductPhotoPK getProductPhotoPK() {
		return productPhotoPK;
	}

	public void setProductPhotoPK(ProductPhotoPK productPhotoPK) {
		this.productPhotoPK = productPhotoPK;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}
	
	

}
