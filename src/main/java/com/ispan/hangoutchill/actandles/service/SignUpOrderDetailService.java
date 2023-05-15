package com.ispan.hangoutchill.actandles.service;

import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.ispan.hangoutchill.actandles.dao.SignUpOrderDetailRepository;
import com.ispan.hangoutchill.actandles.model.ActivitiesandLesson;
import com.ispan.hangoutchill.actandles.model.SignUpOrderDetail;
import com.ispan.hangoutchill.member.model.NormalMember;

@Service
public class SignUpOrderDetailService {
	@Autowired
	private SignUpOrderDetailRepository suoRepository;
	
	
//	public void createOrder(NormalMember result , ActivitiesandLesson aal,String ind,Integer number) {
//		SignUpOrderDetail suod = new SignUpOrderDetail();
//		String uuid = ind.substring(0, 2);
//		String time = ind.substring(2, 5);
//		System.out.println("uuid："+uuid);
//		System.out.println("time："+time);
//		System.out.println("memberID："+result.getId());
//		
//		suod.setOrderNumber("AaL"+aal.getId()+aal.getNormalMember().getId()+result.getId()+uuid+time);
//		suod.setMemberName(result.getReallName());
//		suod.setShopName(aal.getNormalMember().getReallName());
//		suod.setAalName(aal.getName());
//		suod.setAalTopic(aal.getTopic());
//		suod.setAmount(number);
//		suod.setPayment("信用卡一次付清");
//		suod.setPaymentAmount(aal.getFee()*number);
//		suod.setTel(result.getTel());
//		
//		suoRepository.save(suod);
//		
//	}
	
	public void createOrder(NormalMember result , ActivitiesandLesson aal,String uuid,String time,Integer number) {
		SignUpOrderDetail suod = new SignUpOrderDetail();
		System.out.println("uuid："+uuid);
		System.out.println("time："+time);
		System.out.println("memberID："+result.getId());
		
		suod.setOrderNumber("AaL"+aal.getId()+aal.getNormalMember().getId()+result.getId()+uuid+time);
		suod.setMemberName(result.getReallName());
		suod.setShopName(aal.getNormalMember().getReallName());
		suod.setAalName(aal.getName());
		suod.setAalTopic(aal.getTopic());
		suod.setAmount(number);
		suod.setPayment("信用卡一次付清");
		suod.setPaymentAmount(aal.getFee()*number);
		suod.setTel(result.getTel());
		
		suod.setMemberId(result.getId());
		suod.setAal_id(aal.getId());
		
		suoRepository.save(suod);
		
	}
	
	public SignUpOrderDetail findByorderNumber(String orderNumber) {
		return suoRepository.findByorderNumber(orderNumber);	
	}
	
	public Page<SignUpOrderDetail> findPageBymemberId(Integer memberId, Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "orderTime");
		Page<SignUpOrderDetail> page = suoRepository.findBymemberId(memberId, pgb);
		
		return page;
		
		
	}

}
