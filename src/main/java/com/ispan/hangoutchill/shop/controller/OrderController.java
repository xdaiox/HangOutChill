package com.ispan.hangoutchill.shop.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;
import com.ispan.hangoutchill.shop.model.Order;
import com.ispan.hangoutchill.shop.service.OrderService;

@Controller
public class OrderController {

	private OrderService orderService;
	private NormalMemberService nMemberService;
	
	@Autowired
	public OrderController(OrderService orderService, NormalMemberService nMemberService) {
		this.orderService = orderService;
		this.nMemberService = nMemberService;
	}

	
	// 結帳controller
	@ResponseBody
	@PostMapping("/shop/ecpaycheckout")
	public String ecpayCheckout(@ModelAttribute("order") Order order,
								@CurrentSecurityContext(expression = "authentication") Authentication authentication){
		String name = authentication.getName();
		NormalMember currentmember = nMemberService.findNormalUserByAccount(name);
		orderService.addOrder(order);
		String checkOutForm = orderService.ecpayCheckout();
		return checkOutForm;
	}
	
	// 綠界交易回傳值接收
	@PostMapping("/shop/ecpayReturn")
	public void ecpayReturnURL(@RequestParam("RtnCode") Integer rtnCode) {
		
	}

	
	
	
}
