package com.ispan.hangoutchill.member.validation;


import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;



@Target(FIELD)
@Retention(RUNTIME)
@Constraint(validatedBy = AccountExistValidator.class)
public @interface Account {

    String message() default "Email existed!";

    Class<?>[] groups() default { };

    Class<? extends Payload>[] payload() default { };
}
