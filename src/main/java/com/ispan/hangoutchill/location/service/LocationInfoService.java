package com.ispan.hangoutchill.location.service;


import com.ispan.hangoutchill.location.dao.LocationInfoRepository;
import com.ispan.hangoutchill.location.dao.LocationOperationTimeRepository;
import com.ispan.hangoutchill.location.model.LocationInfo;
import com.ispan.hangoutchill.location.model.LocationOperationTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
public class LocationInfoService {

    @Autowired
    private LocationInfoRepository locRepo;
    @Autowired
    private LocationOperationTimeRepository locOptRepo;

    //    ========================LocationStoreInfoManager 地點資料管理===============================

    //查詢所有地點 透過page
    public Page<LocationInfo> findAllLocationInfoByPage(Integer pageNumber){
        Pageable pgb = PageRequest.of(pageNumber-1,5,Sort.Direction.DESC,"locId");
        Page<LocationInfo> page = locRepo.findAll(pgb);
        return page;
    }

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



}
