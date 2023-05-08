package com.ispan.hangoutchill.member.model;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;
import com.ispan.hangoutchill.xdaiox.model.Discussions;
import com.ispan.hangoutchill.xdaiox.model.Favourite;
import com.ispan.hangoutchill.xdaiox.model.Images;
import com.ispan.hangoutchill.xdaiox.model.Messages;
import javax.persistence.*;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;
import com.ispan.hangoutchill.shop.model.ShoppingCart;

@Entity
@Table(name="normalAccount")
public class NormalMember {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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

    @Column(name = "nomal_tel")
    private String tel;
    @Column(name = "profilephoto")
    private String photoB64;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="FK_role_id", foreignKey=@ForeignKey(name = "role_id"))
    private Role role;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name="registeration_time")
    private Date registTime;

    @OneToOne(mappedBy = "normalMember")
    private SecuredToken securedToken;

    @Column(name="enabled")
    private boolean enabled;

    @Transient
    private MultipartFile file;

    @Transient
    private String identity;


    @PrePersist
    public void onCreate() {
        if(registTime == null) {
            registTime = new Date();
        }
    }
    
    @OneToMany(mappedBy = "normalMember",fetch=FetchType.LAZY,
    		cascade = {CascadeType.PERSIST},orphanRemoval = true)
    private Set<Discussions> discussions = new LinkedHashSet<>();
    
    @OneToMany(mappedBy = "normalMmeber",fetch=FetchType.LAZY,
			cascade = {CascadeType.PERSIST},orphanRemoval = true)
    private Set<Messages> messages = new LinkedHashSet<>();

    @OneToMany(mappedBy = "normalMember",fetch=FetchType.LAZY,
			cascade = {CascadeType.PERSIST},orphanRemoval = true)
    private Set<Favourite> favourite = new LinkedHashSet<>();

    
    @OneToMany(mappedBy = "fkImgNormalMmeber",fetch=FetchType.LAZY,
			cascade = {CascadeType.PERSIST},orphanRemoval = true)
    private Set<Images> images = new LinkedHashSet<>();

    
    public Set<Discussions> getDiscussions() {
 		return discussions;
 	}

 	public void setDiscussions(Set<Discussions> discussions) {
 		this.discussions = discussions;
 	}

 	public Set<Messages> getMessages() {
 		return messages;
 	}

 	public void setMessages(Set<Messages> messages) {
 		this.messages = messages;
 	}

 	public Set<Images> getImages() {
 		return images;
 	}

 	public void setImages(Set<Images> images) {
 		this.images = images;
 	}
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    
    // shop 自行加入
    @OneToMany(mappedBy="member",
                cascade = CascadeType.PERSIST)
	private Set<ShoppingCart> shoppingCart = new LinkedHashSet<>();
    
    public Set<ShoppingCart> getShoppingCart() {
    	return shoppingCart;
    }
    public void setShoppingCart(Set<ShoppingCart> shoppingCart) {
    	this.shoppingCart = shoppingCart;
    }
    // shop 自行加入
    
    
    
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

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public SecuredToken getSecuredToken() {
        return securedToken;
    }

    public void setSecuredToken(SecuredToken securedToken) {
        this.securedToken = securedToken;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }
}
