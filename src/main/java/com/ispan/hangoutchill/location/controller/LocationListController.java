package com.ispan.hangoutchill.location.controller;

import com.ispan.hangoutchill.location.dao.LocationListRepository;
import com.ispan.hangoutchill.location.model.LocationStoreInfo;
import com.ispan.hangoutchill.location.service.LocationListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
public class LocationListController {

    @Autowired
    private LocationListService locationListServiceService;


//    ============================新增修改刪除==================================

    //新增LocationStoreInfo頁面
    @GetMapping("/location/LocationStoreInfo/addPage")
    public String addLocationStoreInfo(Model model) {
        model.addAttribute("locationStoreInfo", new LocationStoreInfo());
        return "location/addLocationStoreInfoPage";
    }

    //新增地點
    @PostMapping("/location/addLocationStoreInfo/post")
    public String postLocationStoreInfo(@ModelAttribute("locationStoreInfo") LocationStoreInfo lsi) {
        locationListServiceService.addLocationStoreInfo(lsi);
        return "location/addLocationStoreInfoPage";
    }

//
//    @DeleteMapping("location/delete")
//    public


//    ========================Show Location List===============================


//    =======================Show Location Single===============================

    //透過LocationLsit頁面 傳送ID 轉跳LocationSingle頁面
//    @GetMapping("/location/locationList/{location_id}")
//    public LocationStoreInfo findLocationById(@PathVariable Integer id) {
//        Optional<LocationStoreInfo> option = locRepo.findById(id);
//        if (option.isPresent()) {
//            LocationStoreInfo result = option.get();
//            return result;
//        }
//        return null;
//    }


}
