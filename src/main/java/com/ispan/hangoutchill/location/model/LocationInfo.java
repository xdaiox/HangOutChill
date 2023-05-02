package com.ispan.hangoutchill.location.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.*;


@Entity
@Table(name = "locationInfo")
public class LocationInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "location_id")
    private Integer locId;
    @Column(name = "location_name")
    private String locName;
    @Column(name = "location_category")
    private String locCat;
//    @ElementCollection
//    @Column(name = "location_tag")
//    private List<String> locTag;
    @Column(name = "location_tag")
    private String locTag;
    @Column(name = "location_priceLevel")
    private Integer locPriceLevel;
    @Column(name = "location_description")
    private String locDesc;
    @Column(name = "location_city")
    private String locCity;
    @Column(name = "location_district")
    private String locDist;
    @Column(name = "location_address")
    private String locAdd;
    @Column(name = "location_tel")
    private String locTel;
    @Column(name = "location_link")
    private String locLink;
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name = "location_info_updateTime",columnDefinition = "datetime")
    private Date locInfoUpdateTime;

    @PrePersist
    public void onCreate() {
            locInfoUpdateTime = new Date();
    }


    //關聯 與LocationOerationTime
    @OneToMany(cascade = CascadeType.ALL,mappedBy = "locationInfo",fetch=FetchType.LAZY)
    private Set<LocationOperationTime> locationOperationTimes = new HashSet<LocationOperationTime>();

    //關聯 與LocationImage
    @OneToOne(cascade = CascadeType.ALL,mappedBy = "locationInfo")
    private LocationImage locationImage;

    //關聯 與LocationOerationTime
    @OneToMany(cascade = CascadeType.ALL,mappedBy = "locationInfo",fetch=FetchType.LAZY)
    private Set<LocationComment> locationComments = new HashSet<LocationComment>();
    //關聯 與LocationImage



    //參數建構子
    public LocationInfo(){}





    public Integer getLocId() {
        return locId;
    }

    public void setLocId(Integer locId) {
        this.locId = locId;
    }

    public String getLocName() {
        return locName;
    }

    public void setLocName(String locName) {
        this.locName = locName;
    }

    public String getLocCat() {
        return locCat;
    }

    public void setLocCat(String locCat) {
        this.locCat = locCat;
    }

    public String getLocTag() {
        return locTag;
    }

    public void setLocTag(String locTag) {
        this.locTag = locTag;
    }

    public Integer getLocPriceLevel() {
        return locPriceLevel;
    }

    public void setLocPriceLevel(Integer locPriceLevel) {
        this.locPriceLevel = locPriceLevel;
    }

    public String getLocDesc() {
        return locDesc;
    }

    public void setLocDesc(String locDesc) {
        this.locDesc = locDesc;
    }

    public String getLocCity() {
        return locCity;
    }

    public void setLocCity(String locCity) {
        this.locCity = locCity;
    }

    public String getLocDist() {
        return locDist;
    }

    public void setLocDist(String locDist) {
        this.locDist = locDist;
    }

    public String getLocAdd() {
        return locAdd;
    }

    public void setLocAdd(String locAdd) {
        this.locAdd = locAdd;
    }

    public String getLocTel() {
        return locTel;
    }

    public void setLocTel(String locTel) {
        this.locTel = locTel;
    }

    public String getLocLink() {
        return locLink;
    }

    public void setLocLink(String locLink) {
        this.locLink = locLink;
    }

    public Date getLocInfoUpdateTime() {
        return locInfoUpdateTime;
    }

    public void setLocInfoUpdateTime(Date locInfoUpdateTime) {
        this.locInfoUpdateTime = locInfoUpdateTime;
    }

    public LocationImage getLocationImage() {
        return locationImage;
    }

    public void setLocationImage(LocationImage locationImage) {
        this.locationImage = locationImage;
    }
}

