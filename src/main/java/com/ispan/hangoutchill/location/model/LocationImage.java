package com.ispan.hangoutchill.location.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="locationImage")
public class LocationImage {

    @Id
    @Column(name = "location_id")
    private Integer locId;

    @Column(name = "location_image_cover")
    private String locImgMain;

    @Column(name = "location_image_gallery_1")
    private String locImgGallery_1;

    @Column(name = "location_image_gallery_2")
    private String locImgGallery_2;

    @Column(name = "location_image_gallery_3")
    private String locImgGallery_3;

    @Column(name = "location_image_gallery_4")
    private String locImgGallery_4;

    @Column(name = "location_image_gallery_5")
    private String locImgGallery_5;

    @Column(name = "location_image_gallery_6")
    private String locImgGallery_6;

    @Column(name = "location_image_gallery_7")
    private String locImgGallery_7;

    @Column(name = "location_image_gallery_8")
    private String locImgGallery_8;

    public Integer getLocId() {
        return locId;
    }

    public void setLocId(Integer locId) {
        this.locId = locId;
    }

    public String getLocImgMain() {
        return locImgMain;
    }

    public void setLocImgMain(String locImgMain) {
        this.locImgMain = locImgMain;
    }

    public String getLocImgGallery_1() {
        return locImgGallery_1;
    }

    public void setLocImgGallery_1(String locImgGallery_1) {
        this.locImgGallery_1 = locImgGallery_1;
    }

    public String getLocImgGallery_2() {
        return locImgGallery_2;
    }

    public void setLocImgGallery_2(String locImgGallery_2) {
        this.locImgGallery_2 = locImgGallery_2;
    }

    public String getLocImgGallery_3() {
        return locImgGallery_3;
    }

    public void setLocImgGallery_3(String locImgGallery_3) {
        this.locImgGallery_3 = locImgGallery_3;
    }

    public String getLocImgGallery_4() {
        return locImgGallery_4;
    }

    public void setLocImgGallery_4(String locImgGallery_4) {
        this.locImgGallery_4 = locImgGallery_4;
    }

    public String getLocImgGallery_5() {
        return locImgGallery_5;
    }

    public void setLocImgGallery_5(String locImgGallery_5) {
        this.locImgGallery_5 = locImgGallery_5;
    }

    public String getLocImgGallery_6() {
        return locImgGallery_6;
    }

    public void setLocImgGallery_6(String locImgGallery_6) {
        this.locImgGallery_6 = locImgGallery_6;
    }

    public String getLocImgGallery_7() {
        return locImgGallery_7;
    }

    public void setLocImgGallery_7(String locImgGallery_7) {
        this.locImgGallery_7 = locImgGallery_7;
    }

    public String getLocImgGallery_8() {
        return locImgGallery_8;
    }

    public void setLocImgGallery_8(String locImgGallery_8) {
        this.locImgGallery_8 = locImgGallery_8;
    }
}
