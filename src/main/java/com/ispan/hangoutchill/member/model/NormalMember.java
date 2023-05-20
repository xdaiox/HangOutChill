package com.ispan.hangoutchill.member.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.ispan.hangoutchill.location.model.LocationFavorite;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;
import com.ispan.hangoutchill.xdaiox.model.Discussions;
import com.ispan.hangoutchill.xdaiox.model.Favourite;
import com.ispan.hangoutchill.xdaiox.model.Images;
import com.ispan.hangoutchill.xdaiox.model.Messages;
import javax.persistence.*;
import java.util.*;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
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
import javax.persistence.ManyToMany;
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

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.ispan.hangoutchill.actandles.model.ActivitiesandLesson;
import com.ispan.hangoutchill.article.model.Article;
import com.ispan.hangoutchill.article.model.ArticleFavorite;
import com.ispan.hangoutchill.shop.model.Order;
import com.ispan.hangoutchill.shop.model.ShoppingCart;
import com.ispan.hangoutchill.xdaiox.model.Discussions;
import com.ispan.hangoutchill.xdaiox.model.Favourite;
import com.ispan.hangoutchill.xdaiox.model.Messages;

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
    @JsonIgnoreProperties("normalMember")
    private Role role;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name="registeration_time")
    private Date registTime;

    @OneToOne(mappedBy = "normalMember")
    @JsonIgnoreProperties("normalMember")
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

    @JsonIgnore
    @OneToMany(mappedBy = "normalMember",fetch=FetchType.LAZY,
    		cascade = {CascadeType.PERSIST},orphanRemoval = true)
    private Set<Discussions> discussions = new LinkedHashSet<>();

    @JsonIgnore
    @OneToMany(mappedBy = "normalMmeber",fetch=FetchType.LAZY,
			cascade = {CascadeType.PERSIST},orphanRemoval = true)
    private Set<Messages> messages = new LinkedHashSet<>();

    @OneToMany(mappedBy = "normalMember",fetch=FetchType.LAZY,
			cascade = {CascadeType.PERSIST},orphanRemoval = true)
    private Set<Favourite> favourite = new LinkedHashSet<>();

    @OneToMany(mappedBy = "addNormalMember",fetch=FetchType.LAZY,
    		cascade = {CascadeType.PERSIST},orphanRemoval = true)
    private Set<Favourite> favDiscussions = new LinkedHashSet<>();
    
    @ManyToOne
    @JoinColumn(name="add_m_id", nullable = true)
    private NormalMember addNormalMember;
    
    public Set<Favourite> getFavourite() {
		return favourite;
	}

	public void setFavourite(Set<Favourite> favourite) {
		this.favourite = favourite;
	}

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
    
//==================設定課程報名的中介表===================    
    
    @ManyToMany(cascade=CascadeType.ALL, mappedBy="accounts")
    List<ActivitiesandLesson> actandles;

	public List<ActivitiesandLesson> getActandles() {
		return actandles;
	}

	public void setActandles(List<ActivitiesandLesson> actandles) {
		this.actandles = actandles;
	}

//======================================================    	
    
    //-------------Article----------------
    
    @OneToMany(mappedBy="normalmember", cascade = CascadeType.PERSIST)
	private Set<ArticleFavorite> favorite = new LinkedHashSet<>();


    @JsonIgnore
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

    
    // shop 自行加入
    @OneToMany(mappedBy="member",
                cascade = CascadeType.PERSIST)
    @JsonIgnoreProperties("normalMember")
	private Set<ShoppingCart> shoppingCart = new LinkedHashSet<>();
    
    public Set<ShoppingCart> getShoppingCart() {
    	return shoppingCart;
    }
    public void setShoppingCart(Set<ShoppingCart> shoppingCart) {
    	this.shoppingCart = shoppingCart;
    }
    

    @JsonIgnore
	@OneToMany(mappedBy="member",
                cascade = CascadeType.PERSIST, orphanRemoval = true)
	private Set<Order> orders = new LinkedHashSet<>();
    
    
    public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	public String getAccount() {
        return account;
    }
	// shop 自行加入


    //==================收藏地點===================


    @OneToMany(mappedBy="normalMember", cascade = CascadeType.PERSIST)
    @JsonIgnoreProperties("normalMember")
    private List<LocationFavorite> locationFavorites;

    public List<LocationFavorite> getLocationFavorites() {
        return locationFavorites;
    }

    public void setLocationFavorites(List<LocationFavorite> locationFavorites) {
        this.locationFavorites = locationFavorites;
    }

    //==================收藏地點===================

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
