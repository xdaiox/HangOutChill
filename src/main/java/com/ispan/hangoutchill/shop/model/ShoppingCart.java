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

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.ispan.hangoutchill.member.model.NormalMember;

@Entity
@Table(name="shoppingCart")
public class ShoppingCart {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="s_id")
	private Integer sId;
	
	
	
	// 等Member資料表中加入以下程式碼後執行此項
		// @OneToMany(mappedBy="member",
	    //            cascade = CascadeType.PERSIST)
		//private Set<ShoppingCart> shoppingCart = new LinkedHashSet<>();
	// 加在此類別中
	
	
	// 購物車測試用加入
	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnore
	@JoinColumn(name="member_id")
	private NormalMember member;
	
	
	
	
	public NormalMember getMember() {
		return member;
	}

	public void setMember(NormalMember member) {
		this.member = member;
	}

	// 購物車測試用加入
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="product_id")
	@JsonIgnore
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
