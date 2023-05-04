package com.ispan.hangoutchill.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShoppingCartController {

	public ShoppingCartController() {
	}

	
	@GetMapping("/shop/shoppingCart")
	public String goShoppingCartPage() {
		return "shop/shoppingCart";
	}
	
	
	
}
