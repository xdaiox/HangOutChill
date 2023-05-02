package com.ispan.hangoutchill.member.model;


import com.ispan.hangoutchill.member.validation.Account;
import com.ispan.hangoutchill.member.validation.ValidPassword;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class NormalMmeberDto {


    @NotNull
    @NotBlank(message = "不可空白")
    @Email(message = "Email Format error")
    @Account
    private String account;


    @NotNull
    @NotBlank(message = "This filed should not be blank")
    @ValidPassword
    private String password;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
