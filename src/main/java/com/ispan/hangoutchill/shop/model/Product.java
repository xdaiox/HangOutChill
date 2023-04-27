package com.ispan.hangoutchill.shop.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;


@Entity
@Table(name="products")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="product_id")
	private Integer productId;
	
	@Column(name="product_name",columnDefinition = "nvarchar(40)")
	private String productName;
	
	@Column(name="category",columnDefinition = "nvarchar(30)")
	private String category;
	
	@Column(name="product_spec",columnDefinition = "nvarchar(200)")
	private String productSpec;
	
	@Column(name="product_description",columnDefinition = "nvarchar(500)")
	private String productDesc;
	
	@Column(name="unitprice")
	private Integer unitPrice;
	
	@Column(name="discount")
	private Double discount;
	
	@Column(name="launchdate",columnDefinition = "date")
	private String launchdate;
	
	@Column(name="coverImage",columnDefinition = "varbinary(max)")
	private byte[] coverImage;
	
	@Transient
	private MultipartFile mainImage;
	
	
	@OneToMany(mappedBy="product",
		       cascade = CascadeType.ALL, orphanRemoval = true)
	private Set<ProductPhoto> photos = new LinkedHashSet<>();
	
	
	@OneToMany(mappedBy="product",
		       cascade = CascadeType.PERSIST, orphanRemoval = true)
	private Set<OrderDetail> orderDetails = new LinkedHashSet<>();
	
	
	@OneToMany(mappedBy="product",
		       cascade = CascadeType.PERSIST, orphanRemoval = true)
	private Set<ShoppingCart> shoppingCarts = new LinkedHashSet<>();
	
	
	public Product() {
	}
	
	public byte[] getCoverImage() {
		return coverImage;
	}
	
	public void setCoverImage(byte[] coverImage) {
		this.coverImage = coverImage;
	}
	
	public MultipartFile getMainImage() {
		return mainImage;
	}
	
	public void setMainImage(MultipartFile mainImage) {
		this.mainImage = mainImage;
	}
	
	public Integer getProductId() {
		return productId;
	}


	public void setProductId(Integer productId) {
		this.productId = productId;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public String getProductSpec() {
		return productSpec;
	}



	public void setProductSpec(String productSpec) {
		this.productSpec = productSpec;
	}



	public String getProductDesc() {
		return productDesc;
	}



	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}



	public Integer getUnitPrice() {
		return unitPrice;
	}



	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}



	public Double getDiscount() {
		return discount;
	}



	public void setDiscount(Double discount) {
		this.discount = discount;
	}



	public String getLaunchdate() {
		return launchdate;
	}



	public void setLaunchdate(String launchdate) {
		this.launchdate = launchdate;
	}

	public Set<ProductPhoto> getPhotos() {
		return photos;
	}

	public void setPhotos(Set<ProductPhoto> photos) {
		this.photos = photos;
	}

	public Set<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Set<ShoppingCart> getShoppingCarts() {
		return shoppingCarts;
	}

	public void setShoppingCarts(Set<ShoppingCart> shoppingCarts) {
		this.shoppingCarts = shoppingCarts;
	}

	
	
}
