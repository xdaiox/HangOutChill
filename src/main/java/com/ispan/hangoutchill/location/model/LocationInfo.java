package com.ispan.hangoutchill.location.model;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import com.ispan.hangoutchill.member.model.NormalMember;

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
    @Column(name = "location_tag")
    private String locTag;
    @Column(name = "location_priceLevel")
    private String locPriceLevel;
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
    @Column(name = "location_status", columnDefinition = "bit", nullable = true)
    private Boolean locStatus;



    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name = "location_info_updateTime",columnDefinition = "datetime")
    private Date locInfoUpdateTime;

    @PrePersist
    public void onCreate() {
            locInfoUpdateTime = new Date();
    }


//    //關聯 與LocationOperationTime
    @OneToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    @JoinColumn(name = "location_operationTime_id")
    private LocationOperationTime locationOperationTime;


//    //關聯 與LocationImage
    @OneToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    @JoinColumn(name = "location_image_id")
    private LocationImage locationImage;


    //關聯與locationMember
    @OneToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    @JoinColumn(name = "member_id")
    private NormalMember normalMember;




    //關聯 與LocationComment
//    @OneToMany(cascade = CascadeType.ALL,mappedBy = "locationInfo",fetch=FetchType.LAZY)
//    private Set<LocationComment> locationComments = new HashSet<LocationComment>();

    @OneToMany(mappedBy="locationInfo", cascade = CascadeType.ALL)
    @JsonIgnoreProperties("locationInfo")
    private List<LocationFavorite> locationFavorites;

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

    public String getLocPriceLevel() {
        return locPriceLevel;
    }

    public void setLocPriceLevel(String locPriceLevel) {
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

    public Boolean getLocStatus() {
        return locStatus;
    }

    public void setLocStatus(Boolean locStatus) {
        this.locStatus = locStatus;
    }

    public Date getLocInfoUpdateTime() {
        return locInfoUpdateTime;
    }

    public void setLocInfoUpdateTime(Date locInfoUpdateTime) {
        this.locInfoUpdateTime = locInfoUpdateTime;
    }

    public LocationOperationTime getLocationOperationTime() {
        return locationOperationTime;
    }

    public void setLocationOperationTime(LocationOperationTime locationOperationTime) {
        this.locationOperationTime = locationOperationTime;
    }

    public LocationImage getLocationImage() {
        return locationImage;
    }

    public void setLocationImage(LocationImage locationImage) {
        this.locationImage = locationImage;
    }


    public NormalMember getNormalMember() {
        return normalMember;
    }

    public void setNormalMember(NormalMember normalMember) {
        this.normalMember = normalMember;
    }
}

