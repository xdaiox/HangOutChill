package com.ispan.hangoutchill;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.hangoutchill.actandles.model.ActivitiesandLesson;
import com.ispan.hangoutchill.actandles.service.AALservice;
import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;



@Controller
public class HomepageController {
	
	@Autowired
	private AALservice aalService;
	 @Autowired
	 private NormalMemberService nMemberService;
	
    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/member/loginHome")
    public String toMemeberChooseIdentity() {
        return "member/chooseIdentity";
    }
    
   
    @GetMapping("/actandles")
    public String showAllActAndLes(@RequestParam(name="p",defaultValue = "1") Integer pagenumber, Model model,
    		@CurrentSecurityContext(expression="authentication") Authentication authentication) {
		
		Page<ActivitiesandLesson> page = aalService.findByStatusforguest(pagenumber);
		Page<ActivitiesandLesson> pageforAct = aalService.findPageByTopic(pagenumber, "act");
		Page<ActivitiesandLesson> pageforLes = aalService.findPageByTopic(pagenumber, "les");
    	String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result",result);
        model.addAttribute("page",page);
        model.addAttribute("pageforAct",pageforAct);
        model.addAttribute("pageforLes",pageforLes);
    	
        return "aal/showAllAaL";
    }

    @GetMapping("/shop/index")
    public String toShopIndex() {
    	return "shop/shopIndex";
    }

    @GetMapping("/dashboard")
    public  String toBackStage(){
        return "/dashboard";
    }

    @GetMapping("/article")
    public String toArticleList() {
    	return "/article/article";
    }
    
    @GetMapping("/article/db")
    public String toDashBoard() {
    	return "dashboard";
    }
}

