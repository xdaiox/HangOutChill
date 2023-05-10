package com.ispan.hangoutchill.location.service;


import com.ispan.hangoutchill.location.dao.LocationInfoRepository;
import com.ispan.hangoutchill.location.model.LocationImage;
import com.ispan.hangoutchill.location.model.LocationInfo;
import com.ispan.hangoutchill.location.model.LocationOperationTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
public class LocationInfoService {

    @Autowired
    private LocationInfoRepository locRepo;

    //    ========================LocationStoreInfoManager 地點資料管理===============================

    //查詢所有地點 透過page
//    public Page<LocationInfo> findAllLocationInfoByPage(Integer pageNumber){
//        Pageable pgb = PageRequest.of(pageNumber-1,5,Sort.Direction.DESC,"locId");
//        Page<LocationInfo> page = locRepo.findAll(pgb);
//        return page;
//    }

    //查詢單一地點 by ID
    public LocationInfo findLocationInfoById(Integer locId) {
        Optional<LocationInfo> option = locRepo.findById(locId);
        if (option.isPresent()) {
            return option.get();
        }
        return null;
    }

    //刪除單一地點 By ID
    public void deleteLocationInfoById(Integer id) {
        locRepo.deleteById(id);
    }

    //新增單一地點
    public void addLocationInfo(LocationInfo locInfo) {
        locRepo.save(locInfo);
    }


    //修改單一地點 By ID
    @Transactional
    public LocationInfo updateLocationInfoById(Integer locId , LocationInfo locationInfo ) {
        Optional<LocationInfo> option = locRepo.findById(locId);
        if (option.isPresent()){
            LocationInfo locOriginal = option.get();
            locOriginal.setLocName(locationInfo.getLocName());
            locOriginal.setLocCat(locationInfo.getLocCat());
            locOriginal.setLocTag(locationInfo.getLocTag());
            locOriginal.setLocPriceLevel(locationInfo.getLocPriceLevel());
            locOriginal.setLocDesc(locationInfo.getLocDesc());
            locOriginal.setLocCity(locationInfo.getLocCity());
            locOriginal.setLocDist(locationInfo.getLocDist());
            locOriginal.setLocAdd(locationInfo.getLocAdd());
            locOriginal.setLocTel(locationInfo.getLocTel());
            locOriginal.setLocLink(locationInfo.getLocLink());
            locOriginal.setLocationOperationTime(locationInfo.getLocationOperationTime());
            locOriginal.setLocationImage(locationInfo.getLocationImage());
            return locOriginal;
        }
        return null;
    }









    //    ========================Show Location List===============================
    //??????動態查詢??????
    //查詢地點 By City 城市
    //查詢地點 By District 區域
    //查詢地點 by Address 地址
    //查詢地點 by Category 分類
    //查詢地點 by Tag 標籤



    //    =======================Show Location Single===============================


    //    ========================自訂方法===============================

    //處理圖片Cover
    public void handleLocationImagCover(LocationInfo locationInfo){
        MultipartFile imagCover = locationInfo.getLocationImage().getImagCover();
        if (imagCover !=null && !imagCover.isEmpty()){
            try{
                byte[] bytes = imagCover.getBytes();
                locationInfo.getLocationImage().setLocImgCover(bytes);

            }catch (IOException e){
                e.printStackTrace();
                throw new RuntimeException("錯誤:"+ e.getMessage());
            }
        }
    }

    //處理圖片G1
    public void handleLocationImagG1(LocationInfo locationInfo){
        MultipartFile imagG1 = locationInfo.getLocationImage().getImagG1();
        if (imagG1 !=null && !imagG1.isEmpty()){
            try{
                byte[] bytes = imagG1.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_1(bytes);

            }catch (IOException e){
                e.printStackTrace();
                throw new RuntimeException("錯誤:"+ e.getMessage());
            }
        }
    }

    //處理圖片G2
    public void handleLocationImagG2(LocationInfo locationInfo){
        MultipartFile imagG2 = locationInfo.getLocationImage().getImagG2();
        if (imagG2 !=null && !imagG2.isEmpty()){
            try{
                byte[] bytes = imagG2.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_2(bytes);

            }catch (IOException e){
                e.printStackTrace();
                throw new RuntimeException("錯誤:"+ e.getMessage());
            }
        }
    }

    //處理圖片G3
    public void handleLocationImagG3(LocationInfo locationInfo){
        MultipartFile imagG3 = locationInfo.getLocationImage().getImagG3();
        if (imagG3 !=null && !imagG3.isEmpty()){
            try{
                byte[] bytes = imagG3.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_3(bytes);

            }catch (IOException e){
                e.printStackTrace();
                throw new RuntimeException("錯誤:"+ e.getMessage());
            }
        }
    }

    //處理圖片G4
    public void handleLocationImagG4(LocationInfo locationInfo){
        MultipartFile imagG4 = locationInfo.getLocationImage().getImagG4();
        if (imagG4 !=null && !imagG4.isEmpty()){
            try{
                byte[] bytes = imagG4.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_4(bytes);

            }catch (IOException e){
                e.printStackTrace();
                throw new RuntimeException("錯誤:"+ e.getMessage());
            }
        }
    }

    //處理圖片G5
    public void handleLocationImagG5(LocationInfo locationInfo){
        MultipartFile imagG5 = locationInfo.getLocationImage().getImagG5();
        if (imagG5 !=null && !imagG5.isEmpty()){
            try{
                byte[] bytes = imagG5.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_5(bytes);

            }catch (IOException e){
                e.printStackTrace();
                throw new RuntimeException("錯誤:"+ e.getMessage());
            }
        }
    }

    //處理圖片G6
    public void handleLocationImagG6(LocationInfo locationInfo){
        MultipartFile imagG6 = locationInfo.getLocationImage().getImagG6();
        if (imagG6 !=null && !imagG6.isEmpty()){
            try{
                byte[] bytes = imagG6.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_6(bytes);

            }catch (IOException e){
                e.printStackTrace();
                throw new RuntimeException("錯誤:"+ e.getMessage());
            }
        }
    }

    //處理圖片G7
    public void handleLocationImagG7(LocationInfo locationInfo){
        MultipartFile imagG7 = locationInfo.getLocationImage().getImagG7();
        if (imagG7 !=null && !imagG7.isEmpty()){
            try{
                byte[] bytes = imagG7.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_7(bytes);

            }catch (IOException e){
                e.printStackTrace();
                throw new RuntimeException("錯誤:"+ e.getMessage());
            }
        }
    }

    //處理圖片G8
    public void handleLocationImagG8(LocationInfo locationInfo){
        MultipartFile imagG8 = locationInfo.getLocationImage().getImagG8();
        if (imagG8 !=null && !imagG8.isEmpty()){
            try{
                byte[] bytes = imagG8.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_8(bytes);

            }catch (IOException e){
                e.printStackTrace();
                throw new RuntimeException("錯誤:"+ e.getMessage());
            }
        }
    }

    //=============================測試=================================

//    public List<LocationInfo> searchLocationInfo(String name, String category , String price,
//                                                 String city, String dist){
//        List<LocationInfo> locationInfo = locRepo.searchLocationInfo(name,category,price,city,dist);
//        return  locationInfo;
//    }

//    public List<LocationInfo> searchLocationInfo(String name, String category, Integer price, String city, String dist) {
//
//        return locRepo.searchLocationInfo(name, category, price, city, dist);
//    }

    public Page<LocationInfo> findAllLocationInfoByPage(Integer pageNumber, String name, String category, Integer price, String city, String dist) {
        if (name != null || category != null || price != null || city != null || dist != null) {
            return searchLocationInfo(name, category, price, city, dist, pageNumber);
        }
        Pageable pageable = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "locId");  //此處透過jpa搜尋 所以排序properties要用實體類屬性
        Page<LocationInfo> page = locRepo.findAll(pageable);
        return page;
    }

    private Page<LocationInfo> searchLocationInfo(String name, String category, Integer price, String city, String dist, Integer pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "location_id"); //此處透過SQL原生語法搜尋 所以排序properties要用資料庫資料表欄位名
        Page<LocationInfo> page = locRepo.searchLocationInfo(name, category, price, city, dist, pageable);
        return page;
    }

}
