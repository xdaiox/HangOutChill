package com.ispan.hangoutchill.member.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="normalAccount")
public class NormalMember {

    @Id
    @Column(name = "member_id")
    private Integer id;
    @Column(name = "normal_account")
    private String account;
    @Column(name="normal_password")
    private String password;
    @Column(name = "real_name")
    private String reallName;
    @Column(name = "nick_name")
    private String nickName;
    @Column(name = "birthdate")
    private String birthdate;
    @Column(name="gender")
    private String gender;
    @Column(name="encrypted_token")
    private String token;
    @Column(name = "nomal_tel")
    private String tel;
    @Column(name = "profilephoto")
    private String photoB64;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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

    public String getReallName() {
        return reallName;
    }

    public void setReallName(String reallName) {
        this.reallName = reallName;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getPhotoB64() {
        return photoB64;
    }

    public void setPhotoB64(String photoB64) {
        this.photoB64 = photoB64;
    }
}