package com.ispan.hangoutchill.member.listener;

import com.ispan.hangoutchill.member.event.OnForgotPassWord;
import com.ispan.hangoutchill.member.event.OnResendAuthenticationMail;
import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.model.SecuredToken;
import com.ispan.hangoutchill.member.service.INormalMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;


import java.util.UUID;


@Component
public class meberListener {

    @Autowired
    private INormalMemberService service;

    @Autowired
    private JavaMailSender mailSender;

    @EventListener
    public void forgetPasswordListener(OnForgotPassWord event) {
        NormalMember normalMember = event.getNormalMember();
        NormalMember member = service.findNormalMemberById(normalMember.getId());
        if (member.getSecuredToken() == null) {
            String token = UUID.randomUUID().toString();
            service.createVerificationTokenForUser(normalMember, token);
            SimpleMailMessage email2 = emailMessage(event, normalMember, token);
            mailSender.send(email2);
        } else {
            SecuredToken securedToken = service.findSecuredToken(member.getSecuredToken().getToken());
            String token = securedToken.getToken();
            SimpleMailMessage email2 = emailMessage(event, normalMember, token);
            mailSender.send(email2);
        }

    }
    @EventListener
    public  void resendAuthenticationMail(OnResendAuthenticationMail event){
        NormalMember normalMember = event.getNormalMember();
        NormalMember member = service.findNormalMemberById(normalMember.getId());
        if (member.getSecuredToken() == null) {
            String token = UUID.randomUUID().toString();
            service.createVerificationTokenForUser(normalMember, token);
            SimpleMailMessage email3 = emailMessage(event, normalMember, token);
            mailSender.send(email3);
        } else {
            SecuredToken securedToken = service.findSecuredToken(member.getSecuredToken().getToken());
            String token = securedToken.getToken();
            SimpleMailMessage email3 = emailMessage(event, normalMember, token);
            mailSender.send(email3);
        }
    }

    private SimpleMailMessage emailMessage(OnForgotPassWord event, NormalMember normalMember, String token) {
        String recipient = normalMember.getAccount();
        String subject = "忘記密碼HangoutChill";
        String verificationUrl = "/forgetPassword?token=" + token;
        String message = "已重新更改密碼"
                + "please check the link below to verify your mail:";
        SimpleMailMessage email2 = new SimpleMailMessage();
        email2.setTo(recipient);
        email2.setSubject(subject);
        email2.setText(message + "\n" + "http://localhost:8080/hangoutchill" + verificationUrl);
        return email2;
    }

    private SimpleMailMessage emailMessage(OnResendAuthenticationMail event, NormalMember normalMember, String token){
        String recipient = normalMember.getAccount();
        String subject = "重寄驗證信";
        String verificationUrl = "/resendAuthenticationMail?token=" + token;
        String message = "已重寄驗證信"
                + "please check the link below to verify your mail:";
        SimpleMailMessage email3 = new SimpleMailMessage();
        email3.setTo(recipient);
        email3.setSubject(subject);
        email3.setText(message + "\n" + "http://localhost:8080/hangoutchill" + verificationUrl);
        return email3;
    }

}
