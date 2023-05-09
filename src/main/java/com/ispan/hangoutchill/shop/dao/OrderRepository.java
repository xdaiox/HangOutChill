package com.ispan.hangoutchill.shop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.shop.model.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {
	
	@Query("from Order where order_no = :orderNo")
	public Order findOrderByOrderNo(@Param(value="orderNo") String orderNo);

}
