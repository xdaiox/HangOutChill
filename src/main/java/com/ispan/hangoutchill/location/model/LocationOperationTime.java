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


    @ManyToOne(fetch=FetchType.LAZY,cascade = CascadeType.ALL)
    @JoinColumn(name="location_id")
    private LocationInfo locationInfo_opt;
    

    @Column(name="weekday")
    private Integer weekday;
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm")
    @Column(name = "openTime")
    private Date locInfoUpdateTime;
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name = "closeTime")
    private Date closeTime;





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

    public Date getLocInfoUpdateTime() {
        return locInfoUpdateTime;
    }

    public void setLocInfoUpdateTime(Date locInfoUpdateTime) {
        this.locInfoUpdateTime = locInfoUpdateTime;
    }

    public Date getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(Date closeTime) {
        this.closeTime = closeTime;
    }

    public LocationInfo getLocationInfo_opt() {
        return locationInfo_opt;
    }

    public void setLocationInfo_opt(LocationInfo locationInfo_opt) {
        this.locationInfo_opt = locationInfo_opt;
    }
}
