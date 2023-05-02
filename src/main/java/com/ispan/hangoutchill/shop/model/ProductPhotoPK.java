package com.ispan.hangoutchill.shop.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Embeddable
public class ProductPhotoPK implements Serializable {

	private static final long serialVersionUID = 1L;

//	@ManyToOne(fetch=FetchType.LAZY)
//	@JoinColumn(name="product_id",referencedColumnName="product_id")
//	private Products product;
	
	@Column(name="product_id")
	private Integer productId;
	
	
	@Column(name="photo_name",columnDefinition = "nvarchar(20)")
	private String photoName;
	
	public ProductPhotoPK() {
		
	}
	
	


	public Integer getProductId() {
		return productId;
	}




	public void setProductId(Integer productId) {
		this.productId = productId;
	}




	public String getPhotoName() {
		return photoName;
	}


	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}	
	
}
