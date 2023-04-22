package com.ispan.hangoutchill.location.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="locationStoreInfo")
public class LocationStoreInfo {

	@Id
    @Column(name = "location_id")
    private Integer locID;

    @Column(name = "locationM_account")
    private String account;
    @Column(name="locationM_password")
    private String password;
    @Column(name = "locationM_name")
    private String name;
    @Column(name = "locationM_token")
    private String token;
    @Column(name = "locationM_legal")
    private String legal;
    @Column(name="locationM_profilephoto")
    private String photoB64;

    @Column(name="location_name")
    private String locName;
    @Column(name = "location_address")
    private String locAdd;
    @Column(name = "location_longtitude")
    private String longtitude;
    @Column(name = "location_latitude")
    private String latitude;
    @Column(name = "location_tel")
    private String locTel;
    @Column(name = "location_category_id")
    private String locCatID;
    @Column(name = "location_description")
    private String locDesc;
    @Column(name = "location_price_rang")
    private String locPriceRang;
    @Column(name = "location_link")
    private String locLink;
    @Column(name = "location_operationTime_id")
    private Integer opTimeID;
    @Column(name = "location_latest_update")
    private String locUpdateTime;




	public Integer getLocID() {
		return locID;
	}
	public void setLocID(Integer locID) {
		this.locID = locID;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getLegal() {
		return legal;
	}
	public void setLegal(String legal) {
		this.legal = legal;
	}
	public String getPhotoB64() {
		return photoB64;
	}
	public void setPhotoB64(String photoB64) {
		this.photoB64 = photoB64;
	}
	public String getLocName() {
		return locName;
	}
	public void setLocName(String locName) {
		this.locName = locName;
	}
	public String getLocAdd() {
		return locAdd;
	}
	public void setLocAdd(String locAdd) {
		this.locAdd = locAdd;
	}
	public String getLongtitude() {
		return longtitude;
	}
	public void setLongtitude(String longtitude) {
		this.longtitude = longtitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLocTel() {
		return locTel;
	}
	public void setLocTel(String locTel) {
		this.locTel = locTel;
	}
	public String getLocCatID() {
		return locCatID;
	}
	public void setLocCatID(String locCatID) {
		this.locCatID = locCatID;
	}
	public String getLocDesc() {
		return locDesc;
	}
	public void setLocDesc(String locDesc) {
		this.locDesc = locDesc;
	}
	public String getLocPriceRang() {
		return locPriceRang;
	}
	public void setLocPriceRang(String locPriceRang) {
		this.locPriceRang = locPriceRang;
	}
	public String getLocLink() {
		return locLink;
	}
	public void setLocLink(String locLink) {
		this.locLink = locLink;
	}
	public Integer getOpTimeID() {
		return opTimeID;
	}
	public void setOpTimeID(Integer opTimeID) {
		this.opTimeID = opTimeID;
	}
	public String getLocUpdateTime() {
		return locUpdateTime;
	}
	public void setLocUpdateTime(String locUpdateTime) {
		this.locUpdateTime = locUpdateTime;
	}










}
