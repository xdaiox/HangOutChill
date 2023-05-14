package com.ispan.hangoutchill;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import com.ispan.hangoutchill.xdaiox.model.Discussions;
import com.ispan.hangoutchill.xdaiox.service.MessagesService;

import java.lang.reflect.Member;



@Controller
public class HomepageController {
    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/member/loginHome")
    public String toMemeberChooseIdentity() {
        return "member/chooseIdentity";
    }

    @GetMapping("/actandles")
    public String showAllActAndLes() {
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
    
    @GetMapping("/article/articleform")
    public String toDashBoard() {
    	return "/article/articleForm";
    }
}

