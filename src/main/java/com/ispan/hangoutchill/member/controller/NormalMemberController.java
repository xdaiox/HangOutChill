package com.ispan.hangoutchill.member.controller;

import com.ispan.hangoutchill.member.UserDetail;
import com.ispan.hangoutchill.member.UserDetailServiceImpl;
import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.model.Role;
import com.ispan.hangoutchill.member.model.SecuredToken;
import com.ispan.hangoutchill.member.registration.OnRegistrationCompleteEvent;
import com.ispan.hangoutchill.member.service.NormalMemberService;
import com.ispan.hangoutchill.member.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Base64;

@Controller
public class NormalMemberController {

    @Autowired
    NormalMemberService nMemberService;

    @Autowired
    RoleService roleService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    UserDetailServiceImpl userDetailService;

    @Autowired
    private ApplicationEventPublisher eventPublisher;

    @ResponseBody
    @GetMapping("/NormalMember/find")
    public NormalMember findNormalMemberById(@RequestParam("id") Integer id) {
        return nMemberService.findNormalMemberById(id);
    }

//    @GetMapping("/member/NormalRegister")
//    public String toNormalMemberRegister() {
//        return "member/registerNormalMember";
//    }

    @GetMapping("/member/login")
    public String toNormalMemberLogin() {
        return "member/normalMemberLogin";
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
            String base64File = "data:image/png;base64," + Base64.getEncoder().encodeToString(fileBytes);
            nMember.setPhotoB64(base64File);
            nMember.setPassword(passwordEncoder.encode(nMember.getPassword()));
            Role roleByid = roleService.findRoleByid(1);
            nMember.setRole(roleByid);
            nMemberService.registNormalMember(nMember);
            eventPublisher.publishEvent(new OnRegistrationCompleteEvent(nMember));
            NormalMember latestRegister = nMemberService.getLatestRegister();
            if (latestRegister != null) {
                model.addAttribute("latest", latestRegister);
            }
            return "member/registResult";
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    @GetMapping("/member/NormalMemberDetail")
    //目前登入的人到會員中心
    public String toMemberCenterPage(@CurrentSecurityContext(expression="authentication")
                                     Authentication authentication, Model model) {
        String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result",result);
        return "/member/normalMemberCenter";
    }
    public String updateNormalMemberInfo(@ModelAttribute("normalMember") NormalMember normalMember, Model model) {

        try {
            byte[] fileBytes = normalMember.getFile().getBytes();
            String base64File = "data:image/png;base64," + Base64.getEncoder().encodeToString(fileBytes);
            NormalMember updateNormalMember = nMemberService.updateById(normalMember.getId(), base64File, normalMember.getNickName());
            model.addAttribute("updateMember", updateNormalMember);
            return "/member/updateResult";
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    @GetMapping("/registrationConfirm")
    public String memberRegistrationConfirm (@RequestParam String token, Model model){
        SecuredToken securedToken = nMemberService.findSecuredToken(token);
        NormalMember normalMember = securedToken.getNormalMember();
        normalMember.setEnabled(true);
        nMemberService.registNormalMember(normalMember);
        return "redirect:/member/login";
    }

    public String toUpdateNormalMember() {
        return "";
    }


}
