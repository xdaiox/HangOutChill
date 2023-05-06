package com.ispan.hangoutchill.member.event;

import com.ispan.hangoutchill.member.model.NormalMember;
import org.springframework.context.ApplicationEvent;

@SuppressWarnings("serial")

public class OnRegistrationCompleteEvent extends ApplicationEvent {


    private NormalMember normalMember;


    public OnRegistrationCompleteEvent(NormalMember normalMember ) {
        super(normalMember);
        this.normalMember = normalMember;
    }


    public NormalMember getNormalMember() {
        return normalMember;
    }
}
