package com.ispan.hangoutchill.shop.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;
import com.ispan.hangoutchill.shop.model.Product;
import com.ispan.hangoutchill.shop.model.ShoppingCart;
import com.ispan.hangoutchill.shop.service.ProductService;
import com.ispan.hangoutchill.shop.service.ShoppingCartService;

@Controller
public class ShoppingCartController {

	private NormalMemberService nMemberService;
	
	private ProductService productService;
	
	private ShoppingCartService shoppingCartService;
	
	
	@Autowired
	public ShoppingCartController(NormalMemberService nMemberService, 
								  ProductService productService,
								  ShoppingCartService shoppingCartService) {
		this.nMemberService = nMemberService;
		this.productService = productService;
		this.shoppingCartService = shoppingCartService;
	}

	
	@GetMapping("/shop/shoppingCart")
	public String goShoppingCartPage(@CurrentSecurityContext(expression = "authentication") Authentication authentication, Model model) {
		String name = authentication.getName();
		NormalMember currentmember = nMemberService.findNormalUserByAccount(name);
		Set<ShoppingCart> cartItems = currentmember.getShoppingCart();
		List<ShoppingCart> carItemsList = new ArrayList<>(cartItems);
		model.addAttribute("shoppingCartItems", carItemsList);
		return "shop/shoppingCart";
	}
	
	@ResponseBody
	@GetMapping("/shop/get/shoppingCartItemNum")
	public Integer getCartItemNums(@CurrentSecurityContext(expression = "authentication") Authentication authentication) {
		String name = authentication.getName();
		NormalMember currentmember = nMemberService.findNormalUserByAccount(name);
		return shoppingCartService.findCartItemsNum(currentmember.getId());
	}
	
	
	
	
	
	@ResponseBody
	@PostMapping("/shop/addcart")
	public String addProductToShoppingCart(
			@CurrentSecurityContext(expression = "authentication") Authentication authentication,
			@RequestBody Map<String,Integer> requestData) {
		String name = authentication.getName();
		NormalMember currentmember = nMemberService.findNormalUserByAccount(name);
		List<Integer> productItems = shoppingCartService.findMemberCartProductIds(currentmember.getId());
//		List<Integer> productItems = shoppingCartService.findMemberCartProductIds(18);
//		NormalMember currentmember = nMemberService.findNormalMemberById(18);
		
		Integer productId = requestData.get("productid");
		System.out.println(productId);
		Integer amount = requestData.get("amount");
		
		// 判斷購物車是否有該項商品
		for(Integer p : productItems) {
			if(productId == p) {
				return "您的購物車已經有該項商品！";
			}
		}
		
		Product currentProduct = productService.getProductById(productId);
		ShoppingCart newAdded = new ShoppingCart();
		
		newAdded.setMember(currentmember);
		newAdded.setProduct(currentProduct);
		newAdded.setAmount(amount);
		
		shoppingCartService.addShoppingCartItem(newAdded);
		
		return "商品已成功加入購物車！";
	}
	
	
	
	
	
	
	
	// 分類頁面點擊購物車按鈕加入購物車 原來寫法
//	@GetMapping("/shop/addcart")
//	public String addProductToShoppingCart(
//			@CurrentSecurityContext(expression = "authentication") Authentication authentication,
//			@RequestParam(name="productid") Integer productId,
//			@RequestParam(name="amount", required=false) Integer amount) {
//		String name = authentication.getName();
//		NormalMember currentmember = nMemberService.findNormalUserByAccount(name);
//		List<Integer> productItems = shoppingCartService.findMemberCartProductIds(currentmember.getId());
//		
//		// 判斷購物車是否有該項商品
//		for(Integer p : productItems) {
//			if(productId == p) {
//				return "您的購物車已經有該項商品！";
//			}
//		}
//		
//		Product currentProduct = productService.getProductById(productId);
//		ShoppingCart newAdded = new ShoppingCart();
//		
//		newAdded.setMember(currentmember);
//		newAdded.setProduct(currentProduct);
//		if(amount != null) {
//			newAdded.setAmount(amount);
//		}else {
//			newAdded.setAmount(1);
//		}
//		
//		shoppingCartService.addShoppingCartItem(newAdded);
//		
//		return "shop/shoppingCart";
//	}
	
}
