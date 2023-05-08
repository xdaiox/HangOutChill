package com.ispan.hangoutchill.shop.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.hangoutchill.shop.dao.OrderRepository;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;

@Service
public class OrderService {

	private OrderRepository orderRepository;
	
	@Autowired
	public OrderService(OrderRepository orderRepository) {
		this.orderRepository = orderRepository;
	}

	public String ecpayCheckout() {

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
		aioCheck.setTotalAmount("888");
		
		// 交易描述
		aioCheck.setTradeDesc("hangoutchilltrade");
		
		// 商品名稱
		aioCheck.setItemName("測試用用用");
		
		// 特店交易編號
		String testNo = UUID.randomUUID().toString().replaceAll("-", "").substring(0,20);
		aioCheck.setMerchantTradeNo(testNo);
		
		// 付款完成後通知回傳網址
		aioCheck.setReturnURL("http://localhost:8080/hangoutchill/shop/ecpayReturn");
		
		// Client端回傳付款成功網址
//		aioCheck.setOrderResultURL("null");
		
		// 輸出畫面的String
		String form = aio.aioCheckOut(aioCheck, null);
		
		return form;
	}
	
}
