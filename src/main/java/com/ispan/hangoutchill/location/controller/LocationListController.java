//package com.ispan.hangoutchill.location.controller;
//
//import com.ispan.hangoutchill.location.dao.LocationListRepository;
//import com.ispan.hangoutchill.location.model.LocationStoreInfo;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.Optional;
//
//@RestController
//public class LocationListController {
//
////    private LocationListRepository locRepo;
//
//
////    ============================新增修改刪除==================================
//
//    //新增地點
////    @PostMapping("/location/add")
////    public LocationStoreInfo addLocation(@RequestBody LocationStoreInfo location) {
////        LocationStoreInfo resLocationStoreInfo = locRepo.save(location);
////        return resLocationStoreInfo;
////    }
////
////    @DeleteMapping("location/delete")
////    public
//
//
////    ========================Show Location List===============================
//
//
////    =======================Show Location Single===============================
//
//    //透過LocationLsit頁面 傳送ID 轉跳LocationSingle頁面
////    @GetMapping("/location/locationList/{location_id}")
////    public LocationStoreInfo findLocationById(@PathVariable Integer id) {
////        Optional<LocationStoreInfo> option = locRepo.findById(id);
////        if (option.isPresent()) {
////            LocationStoreInfo result = option.get();
////            return result;
////        }
////        return null;
////    }
//
//
//}
