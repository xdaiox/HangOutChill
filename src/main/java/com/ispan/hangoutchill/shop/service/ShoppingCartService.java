package com.ispan.hangoutchill.shop.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		
		List<Product> productList = shoppingCartRepository.findProductsByMemberid(memberId);
		List<Integer> productIds = new ArrayList<>();
		for(Product p : productList) {
			productIds.add(p.getProductId());
		}
		return productIds;
	}
	
	
	public void addShoppingCartItem(ShoppingCart cartItem) {
		shoppingCartRepository.save(cartItem);
	}
	
	public Integer findCartItemsNum(Integer memberId) {
		return shoppingCartRepository.findProductNumInCart(memberId);
	}
	
	public void deleteCartItemById(Integer cartId) {
		shoppingCartRepository.deleteById(cartId);
	}
	
	@Transactional
	public ShoppingCart updateProductAmount(Integer cartId, Integer amount) {
		Optional<ShoppingCart> option = shoppingCartRepository.findById(cartId);
		if(option.isPresent()) {
			ShoppingCart cartItem = option.get();
			cartItem.setAmount(amount);
			return cartItem;
		}
		
		return null;
	}
	
	
	public Integer totalPriceCount(List<ShoppingCart> cartItems) {
		Integer totalPrice = 0;
		for(ShoppingCart item : cartItems) {
			Integer amount = item.getAmount();
			Integer unitPrice = item.getProduct().getUnitPrice();
			Double discount = item.getProduct().getDiscount();
			Integer subtotal = (int) Math.round(amount * unitPrice * discount) ;
			totalPrice += subtotal;
		}
		return totalPrice;
	}
	
	public List<ShoppingCart> findShoppingCartItemsByMemberId(Integer memberId){
		return shoppingCartRepository.findShoppingCartItemsByMemberId(memberId);
	}
	
	public Integer deleteShoppingCartItmesByMemberId(Integer memberId) {
		return shoppingCartRepository.deleteShoppingCartItemsByMemberId(memberId);
	}
	
	
}
