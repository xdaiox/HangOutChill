package com.ispan.hangoutchill.location.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;


@Entity
@Table(name="locationOperationTime")
public class LocationOperationTime {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "location_operationTime_id")
    private Integer opTimeID;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm")
    @Column(name="mondayOpen")
    private Date mondayOpen;
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm")
    @Column(name="mondayClose")
    private Date mondayClose;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm")
    @Column(name="tuesdayOpen")
    private Date tuesdayOpen;
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm")
    @Column(name="tuesdayClose")
    private Date tuesdayClose;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm")
    @Column(name="wednesdayOpen")
    private Date wednesdayOpen;
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm")
    @Column(name="wednesdayClose")
    private Date wednesdayClose;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm")
    @Column(name="thursdayOpen")
    private Date thursdayOpen;
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm")
    @Column(name="thursdayClose")
    private Date thursdayClose;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm")
    @Column(name="fridayOpen")
    private Date fridayOpen;
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm")
    @Column(name="fridayClose")
    private Date fridayClose;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm")
    @Column(name="saturdayOpen")
    private Date saturdayOpen;
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm")
    @Column(name="saturdayClose")
    private Date saturdayClose;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm")
    @Column(name="sundayOpen")
    private Date sundayOpen;
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "HH:mm")
    @Column(name="sundayClose")
    private Date sundayClose;


//    @OneToOne(cascade = CascadeType.ALL)
////    @JoinColumn (name = "location_id",foreignKey=@ForeignKey(name="location_id"))
////    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @JoinColumn (name = "location_id")
//    private LocationInfo locationInfo;



//    @Column(name="weekday")
//    private Integer weekday;
//    @Temporal(TemporalType.TIMESTAMP)
//    @DateTimeFormat(pattern = "HH:mm")
//    @Column(name = "openTime")
//    private Date openTime;
//    @Temporal(TemporalType.TIMESTAMP)
//    @DateTimeFormat(pattern = "HH:mm")
//    @Column(name = "closeTime")
//    private Date closeTime;
//
//    //對應locationInfo
//    @ManyToOne(fetch=FetchType.LAZY,cascade = CascadeType.ALL)
//    @JoinColumn(name="location_id")
//    private LocationInfo locationInfo;




    //參數建構子
    public LocationOperationTime(){}

    public Integer getOpTimeID() {
        return opTimeID;
    }

    public void setOpTimeID(Integer opTimeID) {
        this.opTimeID = opTimeID;
    }

    public Date getMondayOpen() {
        return mondayOpen;
    }

    public void setMondayOpen(Date mondayOpen) {
        this.mondayOpen = mondayOpen;
    }

    public Date getMondayClose() {
        return mondayClose;
    }

    public void setMondayClose(Date mondayClose) {
        this.mondayClose = mondayClose;
    }

    public Date getTuesdayOpen() {
        return tuesdayOpen;
    }

    public void setTuesdayOpen(Date tuesdayOpen) {
        this.tuesdayOpen = tuesdayOpen;
    }

    public Date getTuesdayClose() {
        return tuesdayClose;
    }

    public void setTuesdayClose(Date tuesdayClose) {
        this.tuesdayClose = tuesdayClose;
    }

    public Date getWednesdayOpen() {
        return wednesdayOpen;
    }

    public void setWednesdayOpen(Date wednesdayOpen) {
        this.wednesdayOpen = wednesdayOpen;
    }

    public Date getWednesdayClose() {
        return wednesdayClose;
    }

    public void setWednesdayClose(Date wednesdayClose) {
        this.wednesdayClose = wednesdayClose;
    }

    public Date getThursdayOpen() {
        return thursdayOpen;
    }

    public void setThursdayOpen(Date thursdayOpen) {
        this.thursdayOpen = thursdayOpen;
    }

    public Date getThursdayClose() {
        return thursdayClose;
    }

    public void setThursdayClose(Date thursdayClose) {
        this.thursdayClose = thursdayClose;
    }

    public Date getFridayOpen() {
        return fridayOpen;
    }

    public void setFridayOpen(Date fridayOpen) {
        this.fridayOpen = fridayOpen;
    }

    public Date getFridayClose() {
        return fridayClose;
    }

    public void setFridayClose(Date fridayClose) {
        this.fridayClose = fridayClose;
    }

    public Date getSaturdayOpen() {
        return saturdayOpen;
    }

    public void setSaturdayOpen(Date saturdayOpen) {
        this.saturdayOpen = saturdayOpen;
    }

    public Date getSaturdayClose() {
        return saturdayClose;
    }

    public void setSaturdayClose(Date saturdayClose) {
        this.saturdayClose = saturdayClose;
    }

    public Date getSundayOpen() {
        return sundayOpen;
    }

    public void setSundayOpen(Date sundayOpen) {
        this.sundayOpen = sundayOpen;
    }

    public Date getSundayClose() {
        return sundayClose;
    }

    public void setSundayClose(Date sundayClose) {
        this.sundayClose = sundayClose;
    }
}
