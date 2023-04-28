//package com.ispan.hangoutchill.location.controller;
//
//import com.ispan.hangoutchill.location.dao.LocationListRepository;
//import com.ispan.hangoutchill.location.model.LocationStoreInfo;
//import com.ispan.hangoutchill.location.service.LocationListService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//import java.util.Optional;
//
//@RestController
//public class LocationListController {
//
//    @Autowired
//    private LocationListService locationListServiceService;
//}
    

//    ============================主頁頁面跳轉==================================

    //跳轉至locationList頁面
//    @GetMapping("/location/locationList")
//    public String toLocationList() {
//        return "/location/locationList";
//    }



//    ========================LocationStoreInfoManager 地點資料管理===============================

//    跳轉至LocationStoreInfoManager頁面
//    @GetMapping("/location/locationManager")
//    public String toLocationManager() {
//        return "/location/locationManagerPage";
//    }


    //查詢所有LocationStoreInfo
//    @GetMapping("/location/locationManager/locationStoreInfo")
//    public List<LocationStoreInfo> findAllLocationStoreInfoList(){
//        return locationListServiceService.findAllLocationStoreInfo();
//    }

    //查詢單一LocationStoreInfo BY ID
//    @GetMapping("/location/locationManager/locationStoreInfo/{id}")
//    public ResponseEntity<LocationStoreInfo> find()

    //新增LocationStoreInfo頁面
//    @GetMapping("/location/locationManager/LocationStoreInfo")
//    public String addLocationStoreInfo(Model model) {
//        model.addAttribute("locationStoreInfo", new LocationStoreInfo());
//        return "location/addLocationStoreInfoPage";
//    }

    //新增LocationStoreInfo動作
//    @PostMapping("/location/locationManager/LocationStoreInfo")
//    public String postLocationStoreInfo(@ModelAttribute("locationStoreInfo") LocationStoreInfo lsi) {
//        locationListServiceService.addLocationStoreInfo(lsi);
//        return "location/addLocationStoreInfoPage";
//    }


    //刪除LocationStoreInfo BY ID





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


