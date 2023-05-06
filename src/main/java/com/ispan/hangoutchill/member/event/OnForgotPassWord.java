package com.ispan.hangoutchill.member.event;

import com.ispan.hangoutchill.member.model.NormalMember;
import org.springframework.context.ApplicationEvent;

public class OnForgotPassWord  extends ApplicationEvent {

    private NormalMember normalMember;

    public NormalMember getNormalMember() {
        return normalMember;
    }

    public void setNormalMember(NormalMember normalMember) {
        this.normalMember = normalMember;
    }

    public OnForgotPassWord(NormalMember normalMember) {
        super(normalMember);
        this.normalMember = normalMember;
    }
}
