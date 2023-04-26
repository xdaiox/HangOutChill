package com.ispan.hangoutchill.location.service;


import com.ispan.hangoutchill.location.dao.LocationListRepository;
import com.ispan.hangoutchill.location.model.LocationStoreInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class LocationListService {

    @Autowired
    private LocationListRepository locRepo;

    //    ========================LocationStoreInfoManager 地點資料管理===============================

    //新增單一地點
    public void addLocationStoreInfo(LocationStoreInfo locInfo) {
        locRepo.save(locInfo);
    }

    //查詢單一地點 by ID
    public LocationStoreInfo findLocationStoreInfoById(Integer id) {
        Optional<LocationStoreInfo> option = locRepo.findById(id);
        if (option.isPresent()) {
            return option.get();
        }
        return null;
    }

    //查詢所有地點 透過page
    public Page<LocationStoreInfo> findAllLocationStoreInfoByPage(Integer pageNumber){
        Pageable pgb = PageRequest.of(pageNumber-1,5,Sort.Direction.DESC,"locID");
        Page<LocationStoreInfo> page = locRepo.findAll(pgb);
        return page;
    }

    //刪除單一地點 By ID
    public void deleteLocationStoreInfoById(Integer id) {
        locRepo.deleteById(id);
    }

    //修改單一地點 By ID
//    @Transactional
//    public LocationStoreInfo updateLocationStoreInfoByID(Integer id ) {
//        public LocationStoreInfo updateLocationStoreInfoById(Integer id ,)
//    }



    //    ========================Show Location List===============================
    //??????動態查詢??????
    //查詢地點 By City 城市
    //查詢地點 By District 區域
    //查詢地點 by Address 地址
    //查詢地點 by Category 分類
    //查詢地點 by Tag 標籤


    //分頁數查詢功能
//    public Page<LocationStoreInfo> findByPage(Integer pageNumber) {
//        Pageable pgb = PageRequest.of(pageNumber - 1, 6, Sort.Direction.DESC, "locID"); //先暫時用ID排序
//        Page<LocationStoreInfo> page = locRepo.findAll(pgb);
//        return page;
//    }



    //    =======================Show Location Single===============================



}
