package com.ispan.hangoutchill.shop.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.hangoutchill.shop.model.OrderDetail;
import com.ispan.hangoutchill.shop.model.OrderDetailPK;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, OrderDetailPK> {

}
