package com.ispan.hangoutchill.shop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.shop.model.Order;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {
	
	@Query("from Order where order_no = :orderNo")
	public Order findOrderByOrderNo(@Param(value="orderNo") String orderNo);

	@Query(value="select top(1) * from orders where member_id = :memberId order by order_id desc",nativeQuery=true)
	public Order findLatestOrderByMemberId(@Param(value="memberId") Integer memberId);

	@Query("from Order where member_id= :memberId order by orderdate desc")
	public List<Order> findOrdersByMemberId(@Param(value="memberId") Integer memberId);
}
