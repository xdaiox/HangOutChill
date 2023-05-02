package com.ispan.hangoutchill.member.model;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "locationMember")
public class LocationMember {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "location_member_id")
    private Integer id;

    @Column(name = "location_member_account")
    private String account;

    @Column(name = "location_memebr_password")
    private String password;

    @Column(name = "location_contact_name")
    private String contactPersonName;

    @Column(name = "location_contact_tel")
    private String contactPersonTel;

    @Column(name = "location_encrypted_token")
    private String token;

    @Column(name = "location_legalDoc")
    private byte[] legalDoc;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name="location_regist_time")
    private Date registTime;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="FK_role_id", foreignKey=@ForeignKey(name = "role_id"))
    private Role role;

    @Transient
    private MultipartFile file;

    @PrePersist
    public void onCreate() {
        if(registTime == null) {
            registTime = new Date();
        }
    }


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

    public String getContactPersonName() {
        return contactPersonName;
    }

    public void setContactPersonName(String contactPersonName) {
        this.contactPersonName = contactPersonName;
    }

    public String getContactPersonTel() {
        return contactPersonTel;
    }

    public void setContactPersonTel(String contactPersonTel) {
        this.contactPersonTel = contactPersonTel;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public byte[] getLegalDoc() {
        return legalDoc;
    }

    public void setLegalDoc(byte[] legalDoc) {
        this.legalDoc = legalDoc;
    }

    public Date getRegistTime() {
        return registTime;
    }

    public void setRegistTime(Date registTime) {
        this.registTime = registTime;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
