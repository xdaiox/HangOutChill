package com.ispan.hangoutchill.shop.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.hangoutchill.shop.model.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {

}
