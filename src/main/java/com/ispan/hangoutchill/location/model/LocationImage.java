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
    private byte[] locImgCover;

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

    //關聯 與LocationInfo
//    @OneToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
//    @JoinColumn(name = "location_id")
//    private LocationInfo locationInfo;


    @Transient
    private MultipartFile imagCover;
    @Transient
    private MultipartFile imagG1;
    @Transient
    private MultipartFile imagG2;
    @Transient
    private MultipartFile imagG3;
    @Transient
    private MultipartFile imagG4;
    @Transient
    private MultipartFile imagG5;
    @Transient
    private MultipartFile imagG6;
    @Transient
    private MultipartFile imagG7;
    @Transient
    private MultipartFile imagG8;



    //參數建構子
    public LocationImage(){}


    public Integer getLocImgId() {
        return locImgId;
    }

    public void setLocImgId(Integer locImgId) {
        this.locImgId = locImgId;
    }

    public byte[] getLocImgCover() {
        return locImgCover;
    }

    public void setLocImgCover(byte[] locImgCover) {
        this.locImgCover = locImgCover;
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

//    public LocationInfo getLocationInfo() {
//        return locationInfo;
//    }
//
//    public void setLocationInfo(LocationInfo locationInfo) {
//        this.locationInfo = locationInfo;
//    }

    public MultipartFile getImagCover() {
        return imagCover;
    }

    public void setImagCover(MultipartFile imagCover) {
        this.imagCover = imagCover;
    }

    public MultipartFile getImagG1() {
        return imagG1;
    }

    public void setImagG1(MultipartFile imagG1) {
        this.imagG1 = imagG1;
    }

    public MultipartFile getImagG2() {
        return imagG2;
    }

    public void setImagG2(MultipartFile imagG2) {
        this.imagG2 = imagG2;
    }

    public MultipartFile getImagG3() {
        return imagG3;
    }

    public void setImagG3(MultipartFile imagG3) {
        this.imagG3 = imagG3;
    }

    public MultipartFile getImagG4() {
        return imagG4;
    }

    public void setImagG4(MultipartFile imagG4) {
        this.imagG4 = imagG4;
    }

    public MultipartFile getImagG5() {
        return imagG5;
    }

    public void setImagG5(MultipartFile imagG5) {
        this.imagG5 = imagG5;
    }

    public MultipartFile getImagG6() {
        return imagG6;
    }

    public void setImagG6(MultipartFile imagG6) {
        this.imagG6 = imagG6;
    }

    public MultipartFile getImagG7() {
        return imagG7;
    }

    public void setImagG7(MultipartFile imagG7) {
        this.imagG7 = imagG7;
    }

    public MultipartFile getImagG8() {
        return imagG8;
    }

    public void setImagG8(MultipartFile imagG8) {
        this.imagG8 = imagG8;
    }
}
