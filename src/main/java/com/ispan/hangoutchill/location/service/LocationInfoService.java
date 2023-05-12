package com.ispan.hangoutchill.location.service;


import com.ispan.hangoutchill.location.dao.LocationInfoRepository;
import com.ispan.hangoutchill.location.dto.locationInfo.LocationInfoRequest;
import com.ispan.hangoutchill.location.model.LocationImage;
import com.ispan.hangoutchill.location.model.LocationInfo;
import com.ispan.hangoutchill.location.model.LocationOperationTime;
import com.ispan.hangoutchill.shop.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.io.IOException;
import java.util.*;
import java.util.function.Consumer;

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
    public LocationInfo updateLocationInfoById(Integer locId , LocationInfo locationInfo) {
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

            locOriginal.getLocationImage().setLocImgCover(locationInfo.getLocationImage().getLocImgCover());
            locOriginal.getLocationImage().setLocImgGallery_1(locationInfo.getLocationImage().getLocImgGallery_1());
            locOriginal.getLocationImage().setLocImgGallery_2(locationInfo.getLocationImage().getLocImgGallery_2());
            locOriginal.getLocationImage().setLocImgGallery_3(locationInfo.getLocationImage().getLocImgGallery_3());
            locOriginal.getLocationImage().setLocImgGallery_4(locationInfo.getLocationImage().getLocImgGallery_4());
            locOriginal.getLocationImage().setLocImgGallery_5(locationInfo.getLocationImage().getLocImgGallery_5());
            locOriginal.getLocationImage().setLocImgGallery_6(locationInfo.getLocationImage().getLocImgGallery_6());
            locOriginal.getLocationImage().setLocImgGallery_7(locationInfo.getLocationImage().getLocImgGallery_7());
            locOriginal.getLocationImage().setLocImgGallery_8(locationInfo.getLocationImage().getLocImgGallery_8());
//            locOriginal.getLocationImage().set

            return locOriginal;
        }
        return null;
    }


    //====================================多條件搜尋 同時處理前台語後台================================================
    public Page<LocationInfo> findAllLocationInfoByPage(String name, String category, String price,
                                                        String city, String dist ,Integer pageNumber){

        Specification<LocationInfo> specification = new Specification<LocationInfo>(){
            @Override
            public Predicate toPredicate(Root<LocationInfo> root, CriteriaQuery<?> query,
                                         CriteriaBuilder criteriaBuilder) {
                List<Predicate> predicateList = new ArrayList<>();

                if (org.apache.commons.lang3.StringUtils.isNotBlank(name)){
                    Predicate predicate = criteriaBuilder.like(root.get("locName"),"%" + name + "%");
                    predicateList.add(predicate);
                }
                if (org.apache.commons.lang3.StringUtils.isNotBlank(category)){
                    Predicate predicate = criteriaBuilder.equal(root.get("locCat"),category);
                    predicateList.add(predicate);
                }
                if (org.apache.commons.lang3.StringUtils.isNotBlank(price)){
                    Predicate predicate = criteriaBuilder.equal(root.get("locPriceLevel"),price);
                    predicateList.add(predicate);
                }
                if (org.apache.commons.lang3.StringUtils.isNotBlank(city)){
                    Predicate predicate = criteriaBuilder.equal(root.get("locCity"),city);
                    predicateList.add(predicate);
                }
                if (org.apache.commons.lang3.StringUtils.isNotBlank(dist)){
                    Predicate predicate = criteriaBuilder.equal(root.get("locDist"),dist);
                    predicateList.add(predicate);
                }
                Predicate[] predicate = new Predicate[predicateList.size()];
                return criteriaBuilder.and(predicateList.toArray(predicate));
            }
        };
        Pageable pageable = PageRequest.of(pageNumber-1,6,Sort.Direction.DESC,"locId");
        if (org.apache.commons.lang3.StringUtils.isNotBlank(name) &&
                org.apache.commons.lang3.StringUtils.isNotBlank(category) &&
                price == null &&
                org.apache.commons.lang3.StringUtils.isNotBlank(city) &&
                org.apache.commons.lang3.StringUtils.isNotBlank(dist)) {
            return locRepo.findAll(pageable);
        } else {
            return locRepo.findAll(specification, pageable);
        }
    }







    //    ========================新增圖片轉碼===============================

    //處理新增圖片Cover
    public void addLocationImagCover(LocationInfo locationInfo){
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

    //處理新增圖片G1
    public void addLocationImagG1(LocationInfo locationInfo){
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

    //處理新增圖片G2
    public void addLocationImagG2(LocationInfo locationInfo){
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

    //處理新增圖片G3
    public void addLocationImagG3(LocationInfo locationInfo){
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

    //處理新增圖片G4
    public void addLocationImagG4(LocationInfo locationInfo){
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

    //處理新增圖片G5
    public void addLocationImagG5(LocationInfo locationInfo){
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

    //處理新增圖片G6
    public void addLocationImagG6(LocationInfo locationInfo){
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

    //處理新增圖片G7
    public void addLocationImagG7(LocationInfo locationInfo){
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

    //處理新增圖片G8
    public void addLocationImagG8(LocationInfo locationInfo){
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




    //=============================編輯圖片轉碼=================================



















}
