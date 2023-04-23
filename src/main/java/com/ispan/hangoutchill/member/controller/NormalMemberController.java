package com.ispan.hangoutchill.member.controller;

import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Base64;

@Controller
public class NormalMemberController {

    @Autowired
    NormalMemberService nMemberService;

    @ResponseBody
    @GetMapping("/NormalMember/find")
    public NormalMember findNormalMemberById(@RequestParam("id") Integer id) {
        return nMemberService.findNormalMemberById(id);
    }

    @GetMapping("/member/NormalRegister")
    public String toNormalMemberRegister() {
        return "member/registerNormalMember";
    }

    @GetMapping("/member/LocationRegister")
    public String toLocationMemberRegister() {
        return "member/registerLocation";
    }

    @GetMapping("/member/registration")
    public String addMessage(Model model) {
        model.addAttribute("newNormalMember", new NormalMember());
        return "member/registerNormalMember";
    }

    @PostMapping("/NormalMember/registed")
    public String registedNormalMember(@ModelAttribute("newNormalMember") NormalMember nMember, Model model) {
        try {
            byte[] fileBytes = nMember.getFile().getBytes();
            String base64File = "data:image/png;base64,"+Base64.getEncoder().encodeToString(fileBytes);
            nMember.setPhotoB64(base64File);
            nMemberService.registNormalMember(nMember);
            NormalMember latestRegister = nMemberService.getLatestRegister();
            if (latestRegister != null) {
                model.addAttribute("latest", latestRegister);
            }
            return "member/registResult";
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }


}
