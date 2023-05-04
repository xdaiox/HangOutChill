package com.ispan.hangoutchill.shop.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ispan.hangoutchill.shop.dao.ShoppingCartRepository;
import com.ispan.hangoutchill.shop.model.Product;
import com.ispan.hangoutchill.shop.model.ShoppingCart;

@Service
public class ShoppingCartService {

	private ShoppingCartRepository shoppingCartRepository;
	
	public ShoppingCartService(ShoppingCartRepository shoppingCartRepository) {
		this.shoppingCartRepository = shoppingCartRepository;
	}

	public List<Integer> findMemberCartProductIds(Integer memberId){
		
		List<Product> productList = shoppingCartRepository.findProductidsByMemberid(memberId);
		List<Integer> productIds = new ArrayList<>();
		for(Product p : productList) {
			productIds.add(p.getProductId());
		}
		return productIds;
	}
	
	
	public void addShoppingCartItem(ShoppingCart cartItem) {
		shoppingCartRepository.save(cartItem);
	}
	
}
