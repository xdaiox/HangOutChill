package com.ispan.hangoutchill.actandles.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.hangoutchill.actandles.dao.SignUpOrderDetailRepository;
import com.ispan.hangoutchill.actandles.model.ActivitiesandLesson;
import com.ispan.hangoutchill.actandles.model.SignUpOrderDetail;
import com.ispan.hangoutchill.member.model.NormalMember;

@Service
public class SignUpOrderDetailService {
	@Autowired
	private SignUpOrderDetailRepository suoRepository;
	
	
	public void createOrder(NormalMember result , ActivitiesandLesson aal,String ind,Integer number) {
		SignUpOrderDetail suod = new SignUpOrderDetail();
		String uuid = ind.substring(0, 2);
		String time = ind.substring(2, 3);
		suod.setOrderNumber("AaL"+aal.getId()+aal.getNormalMember().getId()+result.getId()+uuid+time);
		suod.setMemberName(result.getReallName());
		suod.setShopName(aal.getNormalMember().getReallName());
		suod.setAalName(aal.getName());
		suod.setAalTopic(aal.getTopic());
		suod.setAmount(number);
		suod.setPayment("信用卡一次付清");
		suod.setPaymentAmount(aal.getFee()*number);
		suod.setTel(result.getTel());
		
		suoRepository.save(suod);
		
	}

}
