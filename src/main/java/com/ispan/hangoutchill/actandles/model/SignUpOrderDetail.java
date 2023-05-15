package com.ispan.hangoutchill.actandles.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name = "SignUpOrderDetail")
public class SignUpOrderDetail {
	
//=======================ID====================================
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="order_id",columnDefinition = "int")
	private Integer id;
//=======================訂單編號(order_number)===================
	@Column(name="order_number",columnDefinition = "nvarchar(max)",nullable = false)
	private String orderNumber;
//=======================訂單成立時間(order_time)===================
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(iso = ISO.DATE)
	@Column(name="order_time",columnDefinition = "datetime")
	private Date orderTime;
	
	@PrePersist
	public void onCreate() {
		if(orderTime == null) {
			orderTime = new Date();
		}
	}
//=======================報名會員(member_name)=====================
	@Column(name="member_name",columnDefinition = "nvarchar(max)",nullable = false)
	private String memberName;
//=======================商家名稱(shop_name)======================
	@Column(name="shop_name",columnDefinition = "nvarchar(max)",nullable = false)
	private String shopName;
//=======================活動名稱(aal_name)======================
	@Column(name="aal_name",columnDefinition = "nvarchar(max)",nullable = false)
	private String aalName;
//=======================活動類別(aal_topic)======================
	@Column(name="aal_topic",columnDefinition = "nvarchar(max)",nullable = false)
	private String aalTopic;
//=======================報名人數(amount)======================
	@Column(name="amount",columnDefinition = "int",nullable = false)
	private Integer amount;
//=======================付款方式(payment)======================
	@Column(name="payment",columnDefinition = "nvarchar(max)",nullable = false)
	private String payment;
	
//=======================付款金額(payment_amount)======================
	@Column(name="payment_amount",columnDefinition = "int",nullable = false)
	private Integer paymentAmount;
	
//=======================連絡電話(tel)======================
	@Column(name="tel",columnDefinition = "nvarchar(max)",nullable = false)
	private String tel;
//=======================報名人id(member_id)======================
	@Column(name="member_id",columnDefinition = "int",nullable = false)
	private Integer memberId;
//=======================廠商id(member_id)======================
	
	@Column(name="aal_id",columnDefinition = "int",nullable = false)
	private Integer aal_id;
	
	
	

	public Integer getAal_id() {
		return aal_id;
	}

	public void setAal_id(Integer aal_id) {
		this.aal_id = aal_id;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getAalName() {
		return aalName;
	}

	public void setAalName(String aalName) {
		this.aalName = aalName;
	}

	public String getAalTopic() {
		return aalTopic;
	}

	public void setAalTopic(String aalTopic) {
		this.aalTopic = aalTopic;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public Integer getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(Integer paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
}
