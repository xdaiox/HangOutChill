package com.ispan.hangoutchill.member.validation;

import com.ispan.hangoutchill.member.service.NormalMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class AccountExistValidator  implements ConstraintValidator<Account,String> {

    @Autowired
    private NormalMemberService normalMemberService;

    @Override
    public boolean isValid(String account, ConstraintValidatorContext context) {

        return normalMemberService.findNormalUserByAccount(account) == null;
    }
}
