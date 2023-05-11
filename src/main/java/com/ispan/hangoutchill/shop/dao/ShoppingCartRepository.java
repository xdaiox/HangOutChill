package com.ispan.hangoutchill.shop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.shop.model.Product;
import com.ispan.hangoutchill.shop.model.ShoppingCart;

public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, Integer> {

	@Query("select product from ShoppingCart where member_id = :memberId")
	public List<Product> findProductsByMemberid(@Param(value="memberId") Integer memberId);
	
	@Query("select COUNT(product) from ShoppingCart where member_id = :memberId")
	public Integer findProductNumInCart(@Param(value="memberId") Integer memberId);
	
	@Query("from ShoppingCart where member_id = :memberId")
	public List<ShoppingCart> findShoppingCartItemsByMemberId(@Param(value="memberId") Integer memberId);
	
}
