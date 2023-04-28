package com.ispan.hangoutchill.location.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;


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
    private Integer locPriceLevel;
    @Column(name = "location_description")
    private String locDesc;
    @Column(name = "location_city")
    private String locCity;
    @Column(name = "location_district")
    private String locDist;
    @Column(name = "location_address")
    private String locAdd;
    @Column(name = "location_latitude")
    private Integer locLat;
    @Column(name = "location_longitude")
    private String locLng;
    @Column(name = "location_tel")
    private String locTel;
    @Column(name = "location_link")
    private String locLink;
    @Column(name = "member_id")
    private String locMemberId;
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name = "location_info_updateTime")
    private Date locInfoUpdateTime;

    @PrePersist
    public void onCreate() {
        if(locInfoUpdateTime == null) {
            locInfoUpdateTime = new Date();
        }
    }

    //for location operation Time
    @OneToMany(mappedBy = "locationInfo_opt", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<LocationOperationTime> locationOperationTimes = new LinkedHashSet<>();

    //for location Image
    @OneToOne(mappedBy = "locationInfo", cascade = CascadeType.ALL, orphanRemoval = true)





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

    public Integer getLocLat() {
        return locLat;
    }

    public void setLocLat(Integer locLat) {
        this.locLat = locLat;
    }

    public String getLocLng() {
        return locLng;
    }

    public void setLocLng(String locLng) {
        this.locLng = locLng;
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

    public String getLocMemberId() {
        return locMemberId;
    }

    public void setLocMemberId(String locMemberId) {
        this.locMemberId = locMemberId;
    }

    public Date getLocInfoUpdateTime() {
        return locInfoUpdateTime;
    }

    public void setLocInfoUpdateTime(Date locInfoUpdateTime) {
        this.locInfoUpdateTime = locInfoUpdateTime;
    }

    public Set<LocationOperationTime> getLocationOperationTimes() {
        return locationOperationTimes;
    }

    public void setLocationOperationTimes(Set<LocationOperationTime> locationOperationTimes) {
        this.locationOperationTimes = locationOperationTimes;
    }
}

