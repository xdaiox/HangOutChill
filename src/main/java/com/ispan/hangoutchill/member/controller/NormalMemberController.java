package com.ispan.hangoutchill.member.controller;

import com.ispan.hangoutchill.member.UserDetailServiceImpl;
import com.ispan.hangoutchill.member.event.OnForgotPassWord;
import com.ispan.hangoutchill.member.event.OnResendAuthenticationMail;
import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.model.Role;
import com.ispan.hangoutchill.member.model.SecuredToken;
import com.ispan.hangoutchill.member.event.OnRegistrationCompleteEvent;
import com.ispan.hangoutchill.member.oauth2.HangoutOauth2User;
import com.ispan.hangoutchill.member.service.NormalMemberService;
import com.ispan.hangoutchill.member.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

@Controller
public class NormalMemberController {

    @Autowired
    NormalMemberService nMemberService;

    @Autowired
    RoleService roleService;

    @Qualifier("encoder")
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

    @GetMapping("/member/login")
    public String toNormalMemberLogin() {
        return "member/normalMemberLogin";
    }



    @GetMapping("/member/LocationRegister")
    public String toLocationMemberRegister(Model model) {
        model.addAttribute("newLocationMember",new NormalMember());
        return "member/registerLocation";
    }

    @GetMapping("/member/forgetPwd")
    public String toFogetPassword(){
        return"member/forgetPwdAlter";
    }

    @GetMapping("/member/resetPwd")
    public String toResetPassWord(@RequestParam(name="id")Integer id,Model model){
        model.addAttribute("memberId", id);
        return "member/resetPwd";
    }

    @GetMapping("/member/registration")
    public String addMessage(Model model) {
        model.addAttribute("newNormalMember", new NormalMember());
        return "member/registerNormalMember";
    }

    @GetMapping("/member/forgetPwdResult")
    public String toPasswordAlterDone(){
        return  "member/passwordAlterDone";
    }

    @ResponseBody
    @GetMapping("/member/existed")
    public Boolean existEmail(@RequestParam(name="account")String account){
        return  nMemberService.existAccount(account);
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

    @PostMapping("/LocationMember/registed")
    public String registedLocationMember(@ModelAttribute("newLocationMember") NormalMember nMember, Model model) {
        try {
            byte[] fileBytes = nMember.getFile().getBytes();
            String base64File = "data:image/png;base64," + Base64.getEncoder().encodeToString(fileBytes);
            nMember.setPhotoB64(base64File);
            nMember.setPassword(passwordEncoder.encode(nMember.getPassword()));
            Role roleByid = roleService.findRoleByid(2);
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

    @GetMapping("/registrationConfirm")
    public String memberRegistrationConfirm(@RequestParam String token) {
        SecuredToken securedToken = nMemberService.findSecuredToken(token);
        NormalMember normalMember = securedToken.getNormalMember();
        normalMember.setEnabled(true);
        nMemberService.registNormalMember(normalMember);
        return "redirect:/member/login";
    }

    @GetMapping("/member/ForgetPwd")
    public String memberForgetPwd(@RequestParam(name="account")String account){
        NormalMember normalUserByAccount = nMemberService.findNormalUserByAccount(account);
        eventPublisher.publishEvent( new OnForgotPassWord(normalUserByAccount));
        return "/member/forgetPwdAlert";
    }

    @GetMapping("/forgetPassword")
    public  String memberForgetPwdConfirm(@RequestParam String token,Model model){
        SecuredToken securedToken = nMemberService.findSecuredToken(token);
        if( securedToken!= null){
            NormalMember normalMemberById = nMemberService.findNormalMemberById(securedToken.getNormalMember().getId());
            model.addAttribute("forgotM",normalMemberById);
            return "/member/forgetPwdUpdate";
        }
        return "";
    }
    @PutMapping("/member/updatePwdForget")
    public  String memberForgetPwdAct(@RequestParam(name = "password") String password, @RequestParam(name="id")Integer id){
        String passwordEncoded = passwordEncoder.encode(password);
        nMemberService.updatePassword(id, passwordEncoded);
        return "redirect:/member/forgetPwdResult";
    }

    @ResponseBody
    @GetMapping("/member/resendMail")
    public String  memberResendAuthenticationMail(@RequestParam(name = "id")Integer id){
        NormalMember member = nMemberService.findNormalMemberById(id);
        eventPublisher.publishEvent( new OnResendAuthenticationMail(member));
        return "驗證信已重新寄送";
    }


    @GetMapping("/resendAuthenticationMail")
    public String resendMailConfirm(@RequestParam String token){
        SecuredToken securedToken = nMemberService.findSecuredToken(token);
        NormalMember normalMember = securedToken.getNormalMember();
        if(normalMember != null){
            return  "redirect:/member/login";
        }
        return  " ";
    }
    @GetMapping("/member/NormalMemberDetail")
    public String toMemberCenterPage(@CurrentSecurityContext(expression = "authentication")
                                     Authentication authentication, Model model) {
        String name = authentication.getName();
        System.out.println(name);
        if (name.contains("@") ){
            System.out.println("原本的");
            NormalMember result = nMemberService.findNormalUserByAccount(name);
            model.addAttribute("result", result);
            return "/member/normalMemberCenter";
        }else {
            HangoutOauth2User hangoutOauth2User = (HangoutOauth2User) authentication.getPrincipal();
            String account = hangoutOauth2User.getEmail();
            NormalMember result = nMemberService.findNormalUserByAccount(account);
            model.addAttribute("result", result);
            return "/member/normalMemberCenter";

        }
    }



    @PutMapping("/member/updateInfo")
    public String putUpdateForMember(@ModelAttribute("result")NormalMember member) throws IOException {
        Integer id = member.getId();
        MultipartFile file = member.getFile();
        byte[] fileBytes =  file.getBytes();
        String base64 = Base64.getEncoder().encodeToString(fileBytes);
        String base64File = "data:image/png;base64," + base64;
        if(base64File.equals("data:image/png;base64,")){
            NormalMember normalMemberById = nMemberService.findNormalMemberById(id);
            nMemberService.updateActByIdForMemberP(id,member,normalMemberById.getPhotoB64());
        }else{
           nMemberService.updateActByIdForMemberP(id,member,base64File);
        }

      return"redirect:/member/NormalMemberDetail";
    }

    @PostMapping("/member/checkPassWord")
    public String matchPassword(@RequestParam("pwd")String password,@RequestParam("memberId")Integer id, Model model){
        NormalMember member = nMemberService.findNormalMemberById(id);
        boolean checked = nMemberService.findPwd(password, id);
        if(checked){
            model.addAttribute("forgotM",member);
            return "/member/forgetPwdUpdate";
        }else {
            return "";
        }
    }


    @GetMapping("/back/members")
    public String findAllMmeber(@RequestParam(name = "p", defaultValue = "1") Integer pageNum, Model model,Model model2) {
        List<NormalMember> findallmember = nMemberService.findallmember(pageNum);
        for (NormalMember members:
             findallmember) {
            Role role = members.getRole();
            String roleName = role.getRoleName();
            members.setIdentity(roleName);
        }
        model.addAttribute("members", findallmember);

        Page<NormalMember> pages = nMemberService.findPages(pageNum);
        model2.addAttribute("page",pages);
        return "/member/showMembers";
    }
    @GetMapping("/back/backUpdateMember")
    public String updateMemberInfoByBack(@RequestParam(name = "id")Integer id,Model model){
        NormalMember normalMemberById = nMemberService.findNormalMemberById(id);
        model.addAttribute("updateMember",normalMemberById);
        return "/member/backUpdate";
    }

    @PutMapping("/back/backUpdateMember")
    public  String putUpdate(@ModelAttribute("updateMember")NormalMember member){
        Integer id = member.getId();
        nMemberService.updateActByIdForBack(id,member);
        return "redirect:/back/members";
    }

    @PutMapping("/back/authority")
    public  String putUpdateEnabled(@RequestParam(name="id") Integer id){
        nMemberService.updateEnable(id);
        return "redirect:/back/members";
    }


    @GetMapping("/back/showNormalMember")
    public String findAllNormalMember(@RequestParam(name="pageNum" , defaultValue = "1")Integer pageNum,Model model){
        Page<NormalMember> allNormalMember = nMemberService.findAllNormalMember(pageNum);
        model.addAttribute("page",allNormalMember);
        return "member/showAllNormalMembers";

    }

    @GetMapping("/back/showLocationMember")
    public String findAllLocationMember(@RequestParam(name="pageNum" , defaultValue = "1")Integer pageNum,Model model){
        Page<NormalMember> allNormalMember = nMemberService.findAllLocationMember(pageNum);
        model.addAttribute("page",allNormalMember);
        return "member/showAllLocationMembers";
    }


}
