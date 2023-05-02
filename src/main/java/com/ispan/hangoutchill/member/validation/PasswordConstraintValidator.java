package com.ispan.hangoutchill.member.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PasswordConstraintValidator  implements ConstraintValidator<ValidPassword,String> {

    private static final String PASSWORD_PATTERN = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=\\S+$).{8,20}$";
    private static final Pattern PATTERN = Pattern.compile(PASSWORD_PATTERN);
    @Override
    public boolean isValid(String password, ConstraintValidatorContext context) {
        return  validatePassword(password);
    }

    private boolean validatePassword(final String password) {
        Matcher matcher = PATTERN.matcher(password);
        return matcher.matches();
    }
}
