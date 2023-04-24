package com.ispan.hangoutchill.location.service;


import com.ispan.hangoutchill.location.dao.LocationListRepository;
import com.ispan.hangoutchill.location.model.LocationStoreInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class LocationListService {

    @Autowired
    private LocationListRepository locRepo;

    //    ========================基礎CRUD===============================

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

    //刪除單一地點
    public void deleteLocationStoreInfoById(Integer id) {
        locRepo.deleteById(id);
    }

    //修改單一地點
//    public LocationStoreInfo updateLocationStoreInfoByID() {}



    //    ========================Show Location List===============================

    //分頁數查詢功能
    public Page<LocationStoreInfo> findByPage(Integer pageNumber) {
        Pageable pgb = PageRequest.of(pageNumber - 1, 6, Sort.Direction.DESC, "locID"); //先暫時用ID排序
        Page<LocationStoreInfo> page = locRepo.findAll(pgb);
        return page;
    }



    //    =======================Show Location Single===============================



}
