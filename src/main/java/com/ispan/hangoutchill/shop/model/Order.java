package com.ispan.hangoutchill.shop.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="orders")
public class Order {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="order_id", columnDefinition="int")
	private Integer orderId;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name="orderdate", columnDefinition="date")
	private Date orderDate;
	
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
	
	// 新增欄位
	
	@Column(name="order_no", columnDefinition="nvarchar(30)")
	private String orderNo;
	
	@Column(name="memberphone", columnDefinition="nvarchar(30)")
	private String memberPhone;
	
	@Column(name="membermail", columnDefinition="nvarchar(50)")
	private String memberMail;
	
	@Column(name="recipientname", columnDefinition="nvarchar(30)")
	private String recipientName;
	
	@Column(name="recipientphone", columnDefinition="nvarchar(30)")
	private String recipientPhone;
	
	@Column(name="recipientmail", columnDefinition="nvarchar(50)")
	private String recipientMail;
	
	
	
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
	
	
	// 自動加入orderDate 及訂單編號
	@PrePersist
	public void createTime() {
		if(orderDate == null) {
			orderDate = new Date();
		}
		
		if(orderNo == null) {
			String head = "HCS";
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssS");
			sdf.setLenient(false);
			String timePart = sdf.format(new Date());
			orderNo = head + timePart;
		}
		
	}
	
	
	public Order() {
	}



	public Integer getOrderId() {
		return orderId;
	}



	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}



	public Date getOrderDate() {
		return orderDate;
	}



	public void setOrderDate(Date orderDate) {
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

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberMail() {
		return memberMail;
	}

	public void setMemberMail(String memberMail) {
		this.memberMail = memberMail;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getRecipientPhone() {
		return recipientPhone;
	}

	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}

	public String getRecipientMail() {
		return recipientMail;
	}

	public void setRecipientMail(String recipientMail) {
		this.recipientMail = recipientMail;
	}

	public Set<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
	
	
	

}
