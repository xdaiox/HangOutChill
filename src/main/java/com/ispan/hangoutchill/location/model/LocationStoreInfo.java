//package com.ispan.hangoutchill.location.model;
//
//import org.springframework.format.annotation.DateTimeFormat;
//
//import javax.persistence.*;
//import java.util.Date;
//
//
//@Entity
//@Table(name = "locationStoreInfo")
//public class LocationStoreInfo {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "location_id")
//    private Integer locID;
//
//    @Column(name = "locationM_account")
//    private String mAccount;
//    @Column(name = "locationM_password")
//    private String mPassword;
//    @Column(name = "locationM_name")
//    private String mName;
//    @Column(name = "locationM_token")
//    private String mToken;
//    @Column(name = "locationM_legal")
//    private String mLegal;
//    @Column(name = "locationM_profilephoto")
//    private String mPhotoB64;
////=================================================================
//    @Column(name = "location_name")
//    private String locName;
//    @Column(name = "location_category_id")
//    private Integer locCatId;
//    @Column(name = "location_tag")
//    private String locTag;
//    @Column(name = "location_description")
//    private String locDesc;
//    @Column(name = "location_address_id")
//    private Integer locAddId;
//    @Column(name = "location_operationTime_id")
//    private Integer locOptId;
//    @Column(name = "location_tel")
//    private String locTel;
//    @Column(name = "location_link")
//    private String locLink;
//    @Column(name = "location_priceLevel")
//    private Integer locPriceLevel;
//    @Column(name = "location_image_id")
//    private Integer locImgId;
//    @Temporal(TemporalType.TIMESTAMP)
//    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
//    @Column(name = "location_info_updateTime")
//    private Date locInfoUpdateTime;
//
//    @PrePersist
//    public void onCreate() {
//        if(locInfoUpdateTime == null) {
//            locInfoUpdateTime = new Date();
//        }
//    }
//
//
//    public Integer getLocID() {
//        return locID;
//    }
//
//    public void setLocID(Integer locID) {
//        this.locID = locID;
//    }
//
//    public String getmAccount() {
//        return mAccount;
//    }
//
//    public void setmAccount(String mAccount) {
//        this.mAccount = mAccount;
//    }
//
//    public String getmPassword() {
//        return mPassword;
//    }
//
//    public void setmPassword(String mPassword) {
//        this.mPassword = mPassword;
//    }
//
//    public String getmName() {
//        return mName;
//    }
//
//    public void setmName(String mName) {
//        this.mName = mName;
//    }
//
//    public String getmToken() {
//        return mToken;
//    }
//
//    public void setmToken(String mToken) {
//        this.mToken = mToken;
//    }
//
//    public String getmLegal() {
//        return mLegal;
//    }
//
//    public void setmLegal(String mLegal) {
//        this.mLegal = mLegal;
//    }
//
//    public String getmPhotoB64() {
//        return mPhotoB64;
//    }
//
//    public void setmPhotoB64(String mPhotoB64) {
//        this.mPhotoB64 = mPhotoB64;
//    }
//
//    public String getLocName() {
//        return locName;
//    }
//
//    public void setLocName(String locName) {
//        this.locName = locName;
//    }
//
//    public Integer getLocCatId() {
//        return locCatId;
//    }
//
//    public void setLocCatId(Integer locCatId) {
//        this.locCatId = locCatId;
//    }
//
//    public String getLocTag() {
//        return locTag;
//    }
//
//    public void setLocTag(String locTag) {
//        this.locTag = locTag;
//    }
//
//    public String getLocDesc() {
//        return locDesc;
//    }
//
//    public void setLocDesc(String locDesc) {
//        this.locDesc = locDesc;
//    }
//
//    public Integer getLocAddId() {
//        return locAddId;
//    }
//
//    public void setLocAddId(Integer locAddId) {
//        this.locAddId = locAddId;
//    }
//
//    public Integer getLocOptId() {
//        return locOptId;
//    }
//
//    public void setLocOptId(Integer locOptId) {
//        this.locOptId = locOptId;
//    }
//
//    public String getLocTel() {
//        return locTel;
//    }
//
//    public void setLocTel(String locTel) {
//        this.locTel = locTel;
//    }
//
//    public String getLocLink() {
//        return locLink;
//    }
//
//    public void setLocLink(String locLink) {
//        this.locLink = locLink;
//    }
//
//    public Integer getLocPriceLevel() {
//        return locPriceLevel;
//    }
//
//    public void setLocPriceLevel(Integer locPriceLevel) {
//        this.locPriceLevel = locPriceLevel;
//    }
//
//    public Integer getLocImgId() {
//        return locImgId;
//    }
//
//    public void setLocImgId(Integer locImgId) {
//        this.locImgId = locImgId;
//    }
//
//    public Date getLocInfoUpdateTime() {
//        return locInfoUpdateTime;
//    }
//
//    public void setLocInfoUpdateTime(Date locInfoUpdateTime) {
//        this.locInfoUpdateTime = locInfoUpdateTime;
//    }
//}
