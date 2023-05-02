package com.ispan.hangoutchill.member.listener;

import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.registration.OnRegistrationCompleteEvent;
import com.ispan.hangoutchill.member.service.INormalMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
public class RegistrationListener  implements ApplicationListener<OnRegistrationCompleteEvent> {

    @Autowired
    private INormalMemberService service;


    @Autowired
    private  JavaMailSender mailSender;

    @Override
    public void onApplicationEvent(OnRegistrationCompleteEvent event) {
        this.confirmRegistration(event);
    }

    private void confirmRegistration(OnRegistrationCompleteEvent event) {
         NormalMember normalMember = event.getNormalMember();
         String token = UUID.randomUUID().toString();
        service.createVerificationTokenForUser(normalMember, token);
        SimpleMailMessage email = emailMessage(event, normalMember, token);
        mailSender.send(email);
    }

    private SimpleMailMessage emailMessage(OnRegistrationCompleteEvent event, NormalMember normalMember, String token) {
        String recipient = normalMember.getAccount();
        String subject ="歡迎註冊HangoutChill";
        String verificationUrl = "/registrationConfirm?token=" + token;
        String message = "Congratulation! You successfully registered,"
                + "please check the link below to verify your mail:";

        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipient);
        email.setSubject(subject);
        email.setText(message + "\n" + "http://localhost:8080/hangoutchill" + verificationUrl);
        return email;
    }

}
