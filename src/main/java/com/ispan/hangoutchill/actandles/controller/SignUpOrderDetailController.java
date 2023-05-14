package com.ispan.hangoutchill.actandles.controller;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan.hangoutchill.actandles.model.ActivitiesandLesson;
import com.ispan.hangoutchill.actandles.model.SignUpOrderDetail;
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
//		@Transactional
//		@PostMapping("/showOrder")
//		public String showECPAYHistoryurder (Model model,@CurrentSecurityContext(expression = "authentication") Authentication authentication,
//				@RequestParam(name = "ind") String ind,@RequestParam(name = "n") Integer number) {
//			String name = authentication.getName();
//			NormalMember result = nMemberService.findNormalUserByAccount(name);
//			System.out.println(authentication.getName());
//			Integer id   = Integer.parseInt(ind.substring(5));
//			ActivitiesandLesson aal = aalService.findAALById(id);
//			suoService.createOrder(result, aal, ind, number); 
//			
//		return "aal/user/historyOrder";
//		}
	//跳轉頁面&單向訂單查詢
		@Transactional
		@PostMapping("/actandles/detail/showOrder")
		public String showECPAYHistoryurder (Model model,@CurrentSecurityContext(expression = "authentication") Authentication authentication,@RequestParam(name = "on")String on) {
			String name = authentication.getName();
			NormalMember result = nMemberService.findNormalUserByAccount(name);
			System.out.println(authentication.getName());
			model.addAttribute("result",result);
			SignUpOrderDetail detail = suoService.findByorderNumber(on);
			model.addAttribute("detail",detail);
			return "aal/user/historyOrder";
		}
		
		@GetMapping("/actandles/detail/gotoMemberCenter")
		public String gotoMemberCenter(Model model,@CurrentSecurityContext(expression = "authentication") Authentication authentication) {
			String name = authentication.getName();
			NormalMember result = nMemberService.findNormalUserByAccount(name);
			model.addAttribute("result",result);
			
			
			return "aal/normalMemberCenterOfAaL";
		}
		

}
