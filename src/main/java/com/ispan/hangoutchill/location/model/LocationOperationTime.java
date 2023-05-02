package com.ispan.hangoutchill.location.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;


@Entity
@Table(name="locationOperationTime")
public class LocationOperationTime {

	@Id
    @Column(name = "location_operationTime_id")
    private Integer opTimeID;

    @Column(name="weekday")
    private Integer weekday;
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm")
    @Column(name = "openTime")
    private Date openTime;
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm")
    @Column(name = "closeTime")
    private Date closeTime;

    //對應locationInfo
    @ManyToOne(fetch=FetchType.LAZY,cascade = CascadeType.ALL)
    @JoinColumn(name="location_id")
    private LocationInfo locationInfo;




    //參數建構子
    public LocationOperationTime(){}


    public Integer getOpTimeID() {
        return opTimeID;
    }

    public void setOpTimeID(Integer opTimeID) {
        this.opTimeID = opTimeID;
    }

    public Integer getWeekday() {
        return weekday;
    }

    public void setWeekday(Integer weekday) {
        this.weekday = weekday;
    }

    public Date getOpenTime() {
        return openTime;
    }

    public void setOpenTime(Date openTime) {
        this.openTime = openTime;
    }

    public Date getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(Date closeTime) {
        this.closeTime = closeTime;
    }

    public LocationInfo getLocationInfo() {
        return locationInfo;
    }

    public void setLocationInfo(LocationInfo locationInfo) {
        this.locationInfo = locationInfo;
    }
}
