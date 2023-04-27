package com.ispan.hangoutchill.location.service;


import com.ispan.hangoutchill.location.dao.LocationInfoRepository;
import com.ispan.hangoutchill.location.model.LocationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class LocationInfoService {

    @Autowired
    private LocationInfoRepository locRepo;

    //    ========================LocationStoreInfoManager 地點資料管理===============================

    //查詢所有地點 透過page
    public Page<LocationInfo> findAllLocationInfoByPage(Integer pageNumber){
        Pageable pgb = PageRequest.of(pageNumber-1,5,Sort.Direction.DESC,"locID");
        Page<LocationInfo> page = locRepo.findAll(pgb);
        return page;
    }

    //新增單一地點
    public void addLocationInfo(LocationInfo locInfo) {
        locRepo.save(locInfo);
    }

    //刪除單一地點 By ID

    public void deleteLocationInfoById(Integer id) {
        locRepo.deleteById(id);
    }


    //修改單一地點 By ID
//    @Transactional
//    public LocationStoreInfo updateLocationStoreInfoByID(Integer id ) {
//        public LocationStoreInfo updateLocationStoreInfoById(Integer id ,)
//    }


    //查詢單一地點 by ID
    public LocationInfo findLocationInfoById(Integer id) {
        Optional<LocationInfo> option = locRepo.findById(id);
        if (option.isPresent()) {
            return option.get();
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
