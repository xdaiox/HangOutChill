package com.ispan.hangoutchill.shop.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.hangoutchill.shop.dao.OrderRepository;
import com.ispan.hangoutchill.shop.model.Order;
import com.ispan.hangoutchill.shop.model.OrderDetail;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Service
public class OrderService {

	private OrderRepository orderRepository;
	
	@Autowired
	public OrderService(OrderRepository orderRepository) {
		this.orderRepository = orderRepository;
	}

	public String ecpayCheckout(Order order, Integer totalPrice) {

		AllInOne aio = new AllInOne("");
		AioCheckOutALL aioCheck = new AioCheckOutALL();
//		AioCheckOutDevide aioCheck = new AioCheckOutDevide();
		
		// 特店編號
		aioCheck.setMerchantID("3002607");
		
		// 特店交易時間
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdf.setLenient(false);
		aioCheck.setMerchantTradeDate(sdf.format(new Date()));
		
		// 交易金額
		aioCheck.setTotalAmount(Integer.toString(totalPrice));
		
		// 交易描述
		aioCheck.setTradeDesc("hangoutchilltrade");
		
		// 商品名稱
		String productList = "";
		Set<OrderDetail> orderDetails = order.getOrderDetails();
		List<OrderDetail> odArray = new ArrayList<>(orderDetails);
		for(OrderDetail od : odArray) {
			productList += od.getProduct().getProductName() + "x" + od.getAmount() + "#";
		}
		
		aioCheck.setItemName(productList.substring(0,productList.length()-1));
		
		// 特店交易編號
		String testNo = UUID.randomUUID().toString().replaceAll("-", "").substring(0,2);
		String inputNo = order.getOrderNo() + testNo;
		aioCheck.setMerchantTradeNo(inputNo);
		
		// 付款完成後通知回傳網址
		aioCheck.setReturnURL("http://localhost:8080/hangoutchill/shop/ecpayReturn");
		
		// Client端回傳付款成功網址
		aioCheck.setOrderResultURL("http://localhost:8080/hangoutchill/shop/orderdetailcheck");
		
		// 輸出畫面的String
		String form = aio.aioCheckOut(aioCheck, null);
		
		return form;
	}
	
	
	public void addOrder(Order order) {
		orderRepository.save(order);
	}
	
	public Order findOrderByOrderNo(String orderNo) {
		return orderRepository.findOrderByOrderNo(orderNo);
	}
	
	public Order findLatestOrderByMemberId(Integer memberId) {
		return orderRepository.findLatestOrderByMemberId(memberId);
	}
	
}
