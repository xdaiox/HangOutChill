package com.ispan.hangoutchill.actandles.dao;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.actandles.model.SignUpOrderDetail;

public interface SignUpOrderDetailRepository  extends JpaRepository<SignUpOrderDetail, Integer>{

	//找到指定會員訂單紀錄
	public Page<SignUpOrderDetail>  findBymemberId(Integer memberId,Pageable pgb);
	
	//找到指定商家活動報名紀錄
	public Page<SignUpOrderDetail>  findByaalId(Integer aalId,Pageable pgb);
	
	public SignUpOrderDetail findByorderNumber(String orderNumber);
	
	
	@Query("SELECT s FROM SignUpOrderDetail s  WHERE member_id = :memberId and aal_id = :aalId")
	public SignUpOrderDetail findOrderDetail(@Param(value ="memberId") Integer memberId , @Param(value = "aalId") Integer aalId);
	
	@Query("SELECT COUNT(*) FROM SignUpOrderDetail  WHERE member_id = :memberId and aal_id = :aalId")
	public Integer findOrder(@Param(value ="memberId") Integer memberId , @Param(value = "aalId") Integer aalId);
 
}
