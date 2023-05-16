package com.ispan.hangoutchill.actandles.dao;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.hangoutchill.actandles.model.SignUpOrderDetail;

public interface SignUpOrderDetailRepository  extends JpaRepository<SignUpOrderDetail, Integer>{

	//找到指定會員訂單紀錄
	public Page<SignUpOrderDetail>  findBymemberId(Integer memberId,Pageable pgb);
	
	//找到指定商家活動報名紀錄
	public Page<SignUpOrderDetail>  findByaalId(Integer aalId,Pageable pgb);
	
	public SignUpOrderDetail findByorderNumber(String orderNumber);
	
 
}
