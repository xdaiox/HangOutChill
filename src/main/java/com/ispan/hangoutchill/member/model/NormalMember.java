package com.ispan.hangoutchill.member.model;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.hangoutchill.article.model.Article;
import com.ispan.hangoutchill.article.model.ArticleFavorite;

import javax.persistence.*;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name="normalAccount")
public class NormalMember {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
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

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name="registeration_time")
    private Date registTime;

    @Transient
    private MultipartFile file;

    @PrePersist
    public void onCreate() {
        if(registTime == null) {
            registTime = new Date();
        }
    }
    
    //-------------Article----------------
    
    @OneToMany(mappedBy="normalmember", cascade = CascadeType.PERSIST)
	private Set<ArticleFavorite> favorite = new LinkedHashSet<>();
    
    @OneToMany(mappedBy="normalmember", cascade = CascadeType.PERSIST, orphanRemoval = true)
    private Set<Article> article = new LinkedHashSet<>();
    
    
    public Set<ArticleFavorite> getFavorite() {
    	return favorite;
    }
    
    public void setFavorite(Set<ArticleFavorite> favorite) {
    	this.favorite = favorite;
    }
    

    public Set<Article> getArticle() {
		return article;
	}

	public void setArticle(Set<Article> article) {
		this.article = article;
	}


    //-------------Article----------------
    

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

    public Date getRegistTime() {
        return registTime;
    }

    public void setRegistTime(Date registTime) {
        this.registTime = registTime;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
