package com.ispan.hangoutchill.member.event;

import com.ispan.hangoutchill.member.model.NormalMember;
import org.springframework.context.ApplicationEvent;

public class OnResendAuthenticationMail extends ApplicationEvent {

    private NormalMember normalMember;

    public OnResendAuthenticationMail(NormalMember normalMember) {
        super(normalMember);
        this.normalMember = normalMember;
    }

    public NormalMember getNormalMember() {
        return normalMember;
    }

}
