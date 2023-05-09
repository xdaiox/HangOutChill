package com.ispan.hangoutchill.member.controller;

import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class MemberRestController {

    @Autowired
    NormalMemberService nMemberService;
    @ResponseBody
    @GetMapping("/back/blurAccount")
    public List<NormalMember> findBlurAccount (@RequestParam(name="accountKey")String account){
//        System.out.println("有近來喔");
        return nMemberService.findBlurMember(account);
    }

//    @ResponseBody
//    @GetMapping("/back/blurPage")
//    public Page<NormalMember> findBlurAccountPage(@RequestParam(name="accountKey")String account,@RequestParam(name="p",defaultValue = "1")Integer page){
//        Page<NormalMember> blurMemberPage = nMemberService.findBlurMemberPage(account, page);
//        System.out.println("有近來喔");
//        return  blurMemberPage;
//    }

}
