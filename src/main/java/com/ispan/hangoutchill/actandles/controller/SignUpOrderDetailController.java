package com.ispan.hangoutchill.actandles.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
		
		@PostMapping("/actandles/showOrder")
		public String showECPAYHistoryurder (Model model,@CurrentSecurityContext(expression = "authentication") Authentication authentication,@RequestParam(name = "on")String on) {
			String name = authentication.getName();
			NormalMember result = nMemberService.findNormalUserByAccount(name);
			System.out.println(authentication.getName());
			model.addAttribute("result",result);
			SignUpOrderDetail detail = suoService.findByorderNumber(on);
			model.addAttribute("detail",detail);
			return "aal/user/historyOrder";
		}
	//重新查詢訂單
		@GetMapping("/actandles/detail/showorder")
		public String showtheHistoryurder (Model model,@CurrentSecurityContext(expression = "authentication") Authentication authentication,
				@RequestParam(name = "aalid")Integer aalid) {
			String name = authentication.getName();
			NormalMember result = nMemberService.findNormalUserByAccount(name);
			model.addAttribute("result",result);
			
			SignUpOrderDetail detail = suoService.findOrderDetail(result.getId(), aalid);
			model.addAttribute("detail",detail);
			return "aal/user/historyOrder";
		}
//================================會員中心================================
		@GetMapping("/actandles/MemberCenter")
		public String gotoMemberCenter(Model model,@CurrentSecurityContext(expression = "authentication") Authentication authentication , @RequestParam(name = "aalid",required = false)Integer aalid,
				@RequestParam(name = "p", defaultValue = "1") Integer pagenumber,@RequestParam(name = "pd", defaultValue = "1") Integer detailpagenumber) {
			String name = authentication.getName();
			NormalMember result = nMemberService.findNormalUserByAccount(name);
			model.addAttribute("result",result);
		//==================================給商家的資料====================================
			 List<ActivitiesandLesson> openedaal = aalService.findByMemberandOpened(result.getId());
			 model.addAttribute("openedaal",openedaal);
			 Page<SignUpOrderDetail> orderdetail = suoService.findPageByaalId(pagenumber, aalid);
			model.addAttribute("orderdetail",orderdetail);
		//==================================給用戶的資料====================================
			Page<ActivitiesandLesson> signup = aalService.findByaccountsId(result.getId(), pagenumber);
			model.addAttribute("signup",signup);
			Page<SignUpOrderDetail> checkout = suoService.findPageBymemberId(result.getId(), detailpagenumber);
			model.addAttribute("checkout",checkout);
			
			return "aal/normalMemberCenterOfAaL";
		}
		

}
