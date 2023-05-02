package com.ispan.hangoutchill.location.model;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

@Entity
@Table(name="locationImage")
public class LocationImage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "location_image_id")
    private Integer locImgId;

    @Column(name = "location_image_cover",columnDefinition = "varbinary(max)")
    private byte[] locImgMain;

    @Column(name = "location_image_gallery_1",columnDefinition = "varbinary(max)")
    private byte[] locImgGallery_1;

    @Column(name = "location_image_gallery_2",columnDefinition = "varbinary(max)")
    private byte[] locImgGallery_2;

    @Column(name = "location_image_gallery_3",columnDefinition = "varbinary(max)")
    private byte[] locImgGallery_3;

    @Column(name = "location_image_gallery_4",columnDefinition = "varbinary(max)")
    private byte[] locImgGallery_4;

    @Column(name = "location_image_gallery_5",columnDefinition = "varbinary(max)")
    private byte[] locImgGallery_5;

    @Column(name = "location_image_gallery_6",columnDefinition = "varbinary(max)")
    private byte[] locImgGallery_6;

    @Column(name = "location_image_gallery_7",columnDefinition = "varbinary(max)")
    private byte[] locImgGallery_7;

    @Column(name = "location_image_gallery_8",columnDefinition = "varbinary(max)")
    private byte[] locImgGallery_8;

    //對應locationInfo
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn (name = "location_id")
    private LocationInfo locationInfo;


    @Transient
    private MultipartFile uploadImg;



    //參數建構子
    public LocationImage(){}


    public Integer getLocImgId() {
        return locImgId;
    }

    public void setLocImgId(Integer locImgId) {
        this.locImgId = locImgId;
    }

    public byte[] getLocImgMain() {
        return locImgMain;
    }

    public void setLocImgMain(byte[] locImgMain) {
        this.locImgMain = locImgMain;
    }

    public byte[] getLocImgGallery_1() {
        return locImgGallery_1;
    }

    public void setLocImgGallery_1(byte[] locImgGallery_1) {
        this.locImgGallery_1 = locImgGallery_1;
    }

    public byte[] getLocImgGallery_2() {
        return locImgGallery_2;
    }

    public void setLocImgGallery_2(byte[] locImgGallery_2) {
        this.locImgGallery_2 = locImgGallery_2;
    }

    public byte[] getLocImgGallery_3() {
        return locImgGallery_3;
    }

    public void setLocImgGallery_3(byte[] locImgGallery_3) {
        this.locImgGallery_3 = locImgGallery_3;
    }

    public byte[] getLocImgGallery_4() {
        return locImgGallery_4;
    }

    public void setLocImgGallery_4(byte[] locImgGallery_4) {
        this.locImgGallery_4 = locImgGallery_4;
    }

    public byte[] getLocImgGallery_5() {
        return locImgGallery_5;
    }

    public void setLocImgGallery_5(byte[] locImgGallery_5) {
        this.locImgGallery_5 = locImgGallery_5;
    }

    public byte[] getLocImgGallery_6() {
        return locImgGallery_6;
    }

    public void setLocImgGallery_6(byte[] locImgGallery_6) {
        this.locImgGallery_6 = locImgGallery_6;
    }

    public byte[] getLocImgGallery_7() {
        return locImgGallery_7;
    }

    public void setLocImgGallery_7(byte[] locImgGallery_7) {
        this.locImgGallery_7 = locImgGallery_7;
    }

    public byte[] getLocImgGallery_8() {
        return locImgGallery_8;
    }

    public void setLocImgGallery_8(byte[] locImgGallery_8) {
        this.locImgGallery_8 = locImgGallery_8;
    }

    public LocationInfo getLocationInfo() {
        return locationInfo;
    }

    public void setLocationInfo(LocationInfo locationInfo) {
        this.locationInfo = locationInfo;
    }

    public MultipartFile getUploadImg() {
        return uploadImg;
    }

    public void setUploadImg(MultipartFile uploadImg) {
        this.uploadImg = uploadImg;
    }
}
