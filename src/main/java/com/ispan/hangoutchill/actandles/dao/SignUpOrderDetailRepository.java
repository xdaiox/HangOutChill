package com.ispan.hangoutchill.actandles.dao;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.hangoutchill.actandles.model.SignUpOrderDetail;

public interface SignUpOrderDetailRepository  extends JpaRepository<SignUpOrderDetail, Integer>{

	
	public Page<SignUpOrderDetail>  findBymemberId(Integer memberId,Pageable pgb);
	
	public SignUpOrderDetail findByorderNumber(String orderNumber);
 
}
