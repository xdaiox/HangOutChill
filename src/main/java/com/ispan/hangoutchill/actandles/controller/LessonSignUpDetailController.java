package com.ispan.hangoutchill.actandles.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan.hangoutchill.actandles.model.ActivitiesandLesson;
import com.ispan.hangoutchill.actandles.service.AALservice;
import com.ispan.hangoutchill.actandles.service.LessonSignUpDetailService;
import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;

@Controller
public class LessonSignUpDetailController {

	@Autowired
	LessonSignUpDetailService lessonSignUpDetailService;
	
	@Autowired
	AALservice aalservice;
	
	@Autowired
	NormalMemberService nMemberService;
	
	@GetMapping("/actandles/detail/lessignup")
	public String lessignuppage(@CurrentSecurityContext(expression="authentication") Authentication authentication,@RequestParam("id") Integer id,Model model) {
		ActivitiesandLesson aal = aalservice.findAALById(id);
		String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
		model.addAttribute("result",result);
		model.addAttribute("aal",aal);
		model.addAttribute("checksignup",aalservice.findSignUpDetail(aal.getId(), result.getId()));
		return "aal/user/signUpPage";
	}
	
	@PostMapping("/actandles/detail/lessignup")
	public String lessignup(@RequestParam("id") Integer id ,@CurrentSecurityContext(expression="authentication") Authentication authentication,Model model) {
		ActivitiesandLesson aal = aalservice.findAALById(id);
		 String name = authentication.getName();
	        NormalMember result = nMemberService.findNormalUserByAccount(name);
	        model.addAttribute("result",result);
	     lessonSignUpDetailService.saveles(aal, result.getId()); 
		return "redirect:/actandles/detail/showmysignup";
	}
	
	@DeleteMapping("/actandles/detail/cancal")
	public String cancal(@RequestParam("id") Integer id ,@CurrentSecurityContext(expression="authentication")
    Authentication authentication) {
		ActivitiesandLesson aal = aalservice.findAALById(id);
		 String name = authentication.getName();
	        NormalMember result = nMemberService.findNormalUserByAccount(name);
	        
	     lessonSignUpDetailService.cancalById(aal, result.getId()); 
		return "redirect:/actandles/detail/showmysignup";
	}
	
	@GetMapping("/actandles/detail/showmysignup")
	public String showMySignUp(@RequestParam(name="p",defaultValue = "1") Integer pagenumber, Model model,@CurrentSecurityContext(expression="authentication")
    Authentication authentication) {
		String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
		Page<ActivitiesandLesson> page = aalservice.findByaccountsId(result.getId(), pagenumber);
		model.addAttribute("page",page);
        model.addAttribute("result",result);
		
		return "aal/showMemberSignUp";
	}
}
