package com.ispan.hangoutchill;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.lang.reflect.Member;

@Controller
public class HomepageController {
    @GetMapping("/")
    public String home(){
        return "index";
    }

    @GetMapping("/member/loginHome")
    public  String toMemeberChooseIdentity (){
    return"member/chooseIdentity";
    }
    
    @GetMapping("/actandles")
    public String showAllActAndLes() {
    	return"aal/showAllAaL";
    }


}
