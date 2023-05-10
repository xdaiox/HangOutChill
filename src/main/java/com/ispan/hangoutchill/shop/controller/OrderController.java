package com.ispan.hangoutchill.shop.controller;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;
import com.ispan.hangoutchill.shop.model.Order;
import com.ispan.hangoutchill.shop.model.OrderDetail;
import com.ispan.hangoutchill.shop.model.ShoppingCart;
import com.ispan.hangoutchill.shop.service.OrderService;
import com.ispan.hangoutchill.shop.service.ShoppingCartService;

@Controller
public class OrderController {

	private OrderService orderService;
	private NormalMemberService nMemberService;
	private ShoppingCartService shoppingCartService;
	
	@Autowired
	public OrderController(OrderService orderService, NormalMemberService nMemberService, ShoppingCartService shoppingCartService) {
		this.orderService = orderService;
		this.nMemberService = nMemberService;
		this.shoppingCartService = shoppingCartService;
	}

	
	// 結帳controller
	@ResponseBody
	@PostMapping("/shop/ecpaycheckout")
	public String ecpayCheckout(@ModelAttribute("order") Order order,
								@CurrentSecurityContext(expression = "authentication") Authentication authentication){
		// 取得目前登入會員物件
		String name = authentication.getName();
		NormalMember currentmember = nMemberService.findNormalUserByAccount(name);
		
		// 將訂單明細的資訊寫入相關物件中
		Set<OrderDetail> ods = new LinkedHashSet<>();
		List<ShoppingCart> cartItems = shoppingCartService.findShoppingCartItemsByMemberId(currentmember.getId());
//		Set<ShoppingCart> cartItems = currentmember.getShoppingCart();
		for(ShoppingCart item : cartItems) {
			OrderDetail od = new OrderDetail();
			od.setAmount(item.getAmount());
			od.setDiscount(item.getProduct().getDiscount());
			od.setProduct(item.getProduct());
			od.setOrder(order);
			ods.add(od);
		}
		
		order.setOrderDetails(ods);
		order.setMember(currentmember);
		orderService.addOrder(order);
		
		// 購物總價計算
		Integer totalPrice = shoppingCartService.totalPriceCount(cartItems);
		String checkOutForm = orderService.ecpayCheckout(order, totalPrice);
		return checkOutForm;
	}
	
	
	// 綠界交易回傳值接收
	@Transactional
	@PostMapping("/shop/ecpayReturn")
	public void ecpayReturnURL(HttpServletRequest request,
								@RequestParam("RtnCode") int rtnCode,
								@RequestParam("MerchantTradeNo") String merchantTradeNo) {
			
		
		
			if(rtnCode == 1) {
			String oriOrderNo = merchantTradeNo.substring(0,18);
			System.out.println(oriOrderNo);
			Order order = orderService.findOrderByOrderNo(oriOrderNo);
			order.setPaymentState(true);
//			return 1;
		}
//			return null;
	}

	// 付款成功後重導回客戶端
	@Transactional
	@PostMapping("/shop/orderdetailcheck")
	public String showOrderDetailPage(@CurrentSecurityContext(expression = "authentication") Authentication authentication, Model model) {
		
		String name = authentication.getName();
		System.out.println(name);
		NormalMember currentmember = nMemberService.findNormalUserByAccount(name);
		Order latestOrder = orderService.findLatestOrderByMemberId(currentmember.getId());
		latestOrder.setPaymentState(true);
		model.addAttribute("order", latestOrder);
		
		return "shop/orderFinishCheck";
	}
	
	
	@GetMapping("/shop/orderdetailpagetest")
	public String orderDetailCheck(@CurrentSecurityContext(expression = "authentication") Authentication authentication, Model model) {
		String name = authentication.getName();
		NormalMember currentmember = nMemberService.findNormalUserByAccount(name);
		Order latestOrder = orderService.findLatestOrderByMemberId(currentmember.getId());
		model.addAttribute("order", latestOrder);
		return "shop/orderFinishCheck";
	}
	
	
}
