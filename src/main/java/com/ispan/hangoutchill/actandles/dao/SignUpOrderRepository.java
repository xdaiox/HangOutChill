package com.ispan.hangoutchill.actandles.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.hangoutchill.actandles.model.SignUpOrderDetail;

public interface SignUpOrderRepository  extends JpaRepository<SignUpOrderDetail, Integer>{

}
