package com.ispan.hangoutchill.member.controller;

import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class NormalMemberController {
   @Autowired
    NormalMemberService nMemberService;
   @ResponseBody
   @GetMapping("/NormalMember/find")
    public NormalMember findNormalMemberById(@RequestParam("id") Integer id){
        return nMemberService.findNormalMemberById(id);
    }
}
