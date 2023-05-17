package com.ispan.hangoutchill.shop.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="productPhotos")
//@SequenceGenerator(name="photo_seq", sequenceName="photo_sequence", allocationSize=1)
public class ProductPhoto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="photo_id",columnDefinition = "int")
	private Integer photoId;
	
	
	@ManyToOne
	@JoinColumn(name="product_id")
	@JsonIgnore
	private Product product;
	
	@Column(name="photo",columnDefinition = "varbinary(max)")
	private byte[] photo;
	
	@Column(name="photo_name",columnDefinition = "nvarchar(20)")
	private String photoName;
	
	
	
	@Transient
	private MultipartFile uploadimg;
	
	
	public ProductPhoto() {
	}
	
	
	
	public Integer getPhotoId() {
		return photoId;
	}


	public void setPhotoId(Integer photoId) {
		this.photoId = photoId;
	}


	

	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product product) {
		this.product = product;
	}
	

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}



	public String getPhotoName() {
		return photoName;
	}



	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}



	public MultipartFile getUploadimg() {
		return uploadimg;
	}



	public void setUploadimg(MultipartFile uploadimg) {
		this.uploadimg = uploadimg;
	}
	
	

}
