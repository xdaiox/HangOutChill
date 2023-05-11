package com.ispan.hangoutchill.shop.model;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name="orderDetails")
public class OrderDetail {

//	@EmbeddedId
//	private OrderDetailPK orderDetailPK;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="orderDetail_id")
	private Integer orderDetailId;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
//	@MapsId("orderId")
	@JoinColumn(name="order_id")
	private Order order;
	
	@ManyToOne(fetch = FetchType.LAZY)
//	@MapsId("productId")
	@JoinColumn(name="product_id")
	private Product product;
	
	
	@Column(name="discount", columnDefinition="numeric(3,2)")
	private Double discount;
	
	
	@Column(name="amount")
	private Integer amount;
	
	
	public OrderDetail() {
	}


//	public OrderDetailPK getOrderDetailPK() {
//		return orderDetailPK;
//	}
//
//
//	public void setOrderDetailPK(OrderDetailPK orderDetailPK) {
//		this.orderDetailPK = orderDetailPK;
//	}

	
	

	public Order getOrder() {
		return order;
	}


	public Integer getOrderDetailId() {
		return orderDetailId;
	}


	public void setOrderDetailId(Integer orderDetailId) {
		this.orderDetailId = orderDetailId;
	}


	public void setOrder(Order order) {
		this.order = order;
	}


	public Product getProduct() {
		return product;
	}


	public void setProduct(Product product) {
		this.product = product;
	}


	public Double getDiscount() {
		return discount;
	}


	public void setDiscount(Double discount) {
		this.discount = discount;
	}


	public Integer getAmount() {
		return amount;
	}


	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	
	
	
}
