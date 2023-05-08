package com.ispan.hangoutchill.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.hangoutchill.shop.service.OrderService;

@Controller
public class OrderController {

	private OrderService orderService;
	
	@Autowired
	public OrderController(OrderService orderService) {
		this.orderService = orderService;
	}

	@ResponseBody
	@PostMapping("/shop/ecpaycheckout")
	public String ecpayCheckout() {
		String checkOutForm = orderService.ecpayCheckout();
		return checkOutForm;
	}
	
	@PostMapping("/shop/ecpayReturn")
	public void ecpayReturnURL(@RequestParam("RtnCode") Integer rtnCode) {
		
	}
	
	
}
