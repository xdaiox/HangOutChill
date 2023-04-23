package com.ispan.hangoutchill.shop.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.hangoutchill.shop.model.ShoppingCart;

public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, Integer> {

}
