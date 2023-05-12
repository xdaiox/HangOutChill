package com.ispan.hangoutchill.actandles.controller;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan.hangoutchill.actandles.model.ActivitiesandLesson;
import com.ispan.hangoutchill.actandles.service.AALservice;
import com.ispan.hangoutchill.actandles.service.SignUpOrderDetailService;
import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;

@Controller
public class SignUpOrderDetailController {
	
	@Autowired
	private SignUpOrderDetailService suoService;
	@Autowired
	private NormalMemberService nMemberService;
	@Autowired
	private AALservice aalService;
	
	//==================================結帳完成跳轉============================================
		@Transactional
		@PostMapping("/showOrder")
		public String showECPAYHistoryurder (Model model,@CurrentSecurityContext(expression = "authentication") Authentication authentication,
				@RequestParam(name = "ind") String ind,@RequestParam(name = "n") Integer number) {
			String name = authentication.getName();
			NormalMember result = nMemberService.findNormalUserByAccount(name);
			System.out.println(authentication.getName());
			Integer id   = Integer.parseInt(ind.substring(5));
			ActivitiesandLesson aal = aalService.findAALById(id);
			suoService.createOrder(result, aal, ind, number); 
			
		return "aal/user/historyOrder";
		}
		
		

}
