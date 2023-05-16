package com.ispan.hangoutchill.shop.controller;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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

	// 後台顯示所有訂單
	@GetMapping("/shop/allorders")
	public String goShowOrders(@RequestParam(name="p", defaultValue="1") Integer pageNum,Model model) {
		Page<Order> page = orderService.findOrdersByPage(pageNum);
		model.addAttribute("orderPage", page);
		return "shop/showOrders";
	}
	
	
	// 後臺顯示單筆訂單資訊
	
	@GetMapping("/shop/order/orderinfo")
	public String showOrderInfo(@RequestParam(name="orderno") String orderNo,Model model) {
		Order order = orderService.findOrderByOrderNo(orderNo);
		List<OrderDetail> ods = new ArrayList<>(order.getOrderDetails());
		model.addAttribute("order", order);
		model.addAttribute("orderDetails", ods);
		return "shop/orderInfo";
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
		order.setPaymentState(false);
		orderService.addOrder(order);
		
		// 購物總價計算
		Integer subtotalPrice = shoppingCartService.totalPriceCount(cartItems);
		Integer totalPrice =0;
		if(subtotalPrice >= 799) {
			totalPrice = subtotalPrice;
		}else {
			totalPrice = subtotalPrice + 100;
		}
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
	public String showOrderDetailPage(@CurrentSecurityContext(expression = "authentication") Authentication authentication, 
			@RequestParam("MerchantTradeNo") String merchantTradeNo,
			Model model) {
		System.out.println(merchantTradeNo);
		String actOrderNo = merchantTradeNo.substring(0, merchantTradeNo.length()-2);
		Order theOrder = orderService.findOrderByOrderNo(actOrderNo);
		theOrder.setPaymentState(true);
		List<OrderDetail> ods = new ArrayList<>(theOrder.getOrderDetails());
		String name = authentication.getName();
		System.out.println(name);
		NormalMember currentmember = nMemberService.findNormalUserByAccount(name);
//		Order latestOrder = orderService.findLatestOrderByMemberId(currentmember.getId());
//		List<OrderDetail> ods = new ArrayList<>(latestOrder.getOrderDetails());
//		latestOrder.setPaymentState(true);
//		model.addAttribute("order", latestOrder);
		model.addAttribute("order", theOrder);
		model.addAttribute("orderDetails", ods);
		model.addAttribute("result",currentmember);
		shoppingCartService.deleteShoppingCartItmesByMemberId(currentmember.getId());
		return "shop/orderFinishCheck";
	}
	
	
	@GetMapping("/shop/orderdetailpagetest")
	public String orderDetailCheck(@CurrentSecurityContext(expression = "authentication") Authentication authentication, Model model) {
		String name = authentication.getName();
		NormalMember currentmember = nMemberService.findNormalUserByAccount(name);
		Order latestOrder = orderService.findLatestOrderByMemberId(currentmember.getId());
		List<OrderDetail> ods = new ArrayList<>(latestOrder.getOrderDetails());
		model.addAttribute("order", latestOrder);
		model.addAttribute("orderDetails", ods);
		model.addAttribute("result",currentmember);
		return "shop/orderFinishCheck";
//		return "redirect:/";
	}

	
}
