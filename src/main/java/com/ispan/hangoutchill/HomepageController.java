package com.ispan.hangoutchill;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.ispan.hangoutchill.xdaiox.model.Discussions;
import com.ispan.hangoutchill.xdaiox.service.DiscussionsService;

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
    
}

