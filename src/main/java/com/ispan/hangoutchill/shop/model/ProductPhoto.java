package com.ispan.hangoutchill.shop.model;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name="productPhoto")
public class ProductPhoto {
	
	@EmbeddedId
	private ProductPhotoPK productPhotoPK;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@MapsId("productId")
	@JoinColumn(name="product_id")
	private Product product;
	
	
	@Column(name="photo")
	private byte[] photo;
	
	public ProductPhoto() {
		
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
