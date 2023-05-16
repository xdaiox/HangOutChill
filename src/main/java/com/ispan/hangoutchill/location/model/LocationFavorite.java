package com.ispan.hangoutchill.location.model;

import com.ispan.hangoutchill.member.model.NormalMember;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Table(name = "LocationFavorite")
@Entity
public class LocationFavorite {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "favorite_id")
    private Integer id;


    @ManyToOne
    @JoinColumn(name="fk_member_id", nullable = true)
    private NormalMember normalMember;

    @ManyToOne
    @JoinColumn(name="fk_location_id", nullable = true)
    private LocationInfo locationInfo;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    @Column(name="addedTime")
    private Date addedTime;


    @PrePersist
    public void onCreate() {
        if(addedTime == null) {
            addedTime = new Date();
        }
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public NormalMember getNormalMember() {
        return normalMember;
    }

    public void setNormalMember(NormalMember normalMember) {
        this.normalMember = normalMember;
    }

    public LocationInfo getLocationInfo() {
        return locationInfo;
    }

    public void setLocationInfo(LocationInfo locationInfo) {
        this.locationInfo = locationInfo;
    }

    public Date getAddedTime() {
        return addedTime;
    }

    public void setAddedTime(Date addedTime) {
        this.addedTime = addedTime;
    }
}
