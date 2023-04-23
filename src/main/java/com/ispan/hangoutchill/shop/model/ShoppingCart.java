package com.ispan.hangoutchill.shop.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="shoppingCart")
public class ShoppingCart {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer sId;
	
	
	
	// 等Member資料表中加入以下程式碼後執行此項
		// @OneToMany(mappedBy="member",
	    //            cascade = CascadeType.PERSIST, orphanRemoval = true)
		//private Set<ShoppingCart> shoppingCart = new LinkedHashSet<>();
	// 加在此類別中
//	@ManyToOne(fetch = FetchTyle.Lazy)
//	@JoinColumn(name="member_id")
//	private Member member;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="product_id")
	private Product product;
	
	
	@Column(name="amount")
	private Integer amount;

	public ShoppingCart() {
	}

	public Integer getsId() {
		return sId;
	}

	public void setsId(Integer sId) {
		this.sId = sId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	
	
}
