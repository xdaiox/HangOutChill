package com.ispan.hangoutchill.shop.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="orders")
public class Order {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="order_id", columnDefinition="int")
	private Integer orderId;
	
	
	
	@Column(name="orderdate", columnDefinition="date")
	private String orderDate;
	
	@Column(name="shipvia", columnDefinition="nvarchar(30)")
	private String shipVia;
	
	@Column(name="shipaddress", columnDefinition="nvarchar(50)")
	private String shipAddress;
	
	@Column(name="paymentvia", columnDefinition="nvarchar(30)")
	private String paymentVia;
	
	@Column(name="paymentstate", columnDefinition="bit")
	private Boolean paymentState;
	
	@Column(name="shippeddate", columnDefinition="date")
	private String shippedDate;
	
	// 等Member資料表中加入以下程式碼後執行此項
	// @OneToMany(mappedBy="member",
    //            cascade = CascadeType.PERSIST, orphanRemoval = true)
	//private Set<Order> orders = new LinkedHashSet<>();
	
//	@ManyToOne(fetch = FetchTyle.Lazy)
//	@JoinColumn(name="member_id")
//	private Member member;
	
	@OneToMany(mappedBy="order",
		       cascade = CascadeType.PERSIST, orphanRemoval = true)
	private Set<OrderDetail> orderDetails = new LinkedHashSet<>();
	
	
	
	public Order() {
	}



	public Integer getOrderId() {
		return orderId;
	}



	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}



	public String getOrderDate() {
		return orderDate;
	}



	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}



	public String getShipVia() {
		return shipVia;
	}



	public void setShipVia(String shipVia) {
		this.shipVia = shipVia;
	}



	public String getShipAddress() {
		return shipAddress;
	}



	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}



	public String getPaymentVia() {
		return paymentVia;
	}



	public void setPaymentVia(String paymentVia) {
		this.paymentVia = paymentVia;
	}



	public Boolean getPaymentState() {
		return paymentState;
	}



	public void setPaymentState(Boolean paymentState) {
		this.paymentState = paymentState;
	}



	public String getShippedDate() {
		return shippedDate;
	}



	public void setShippedDate(String shippedDate) {
		this.shippedDate = shippedDate;
	}

}
