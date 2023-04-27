package com.ispan.hangoutchill.location.controller;

import com.ispan.hangoutchill.location.model.Location;
import com.ispan.hangoutchill.location.service.LocationListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LocationListController {

    @Autowired
    private LocationListService locationListService;


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


    //查詢所有LocationStoreInfo 即LocationStoreInfo Manager畫面
    @GetMapping("/location/locationManager")
    public String showAllLocationStoreInfo(@RequestParam(name ="p" ,defaultValue = "1") Integer pageNumber,Model model){
        Page<Location> page = locationListService.findAllLocationStoreInfoByPage(pageNumber);
        model.addAttribute("page", page);
        return "location/locationManagerPage";

    }


    //查詢單一LocationStoreInfo BY ID
//    @GetMapping("/location/locationManager/locationStoreInfo/{id}")
//    public ResponseEntity<LocationStoreInfo> find()

    //新增LocationStoreInfo頁面
    @GetMapping("/location/locationManager/addLocationStoreInfo")
    public String toAddLocationStoreInfo(Model model) {
        model.addAttribute("locationStoreInfo", new Location());
        return "location/addLocationStoreInfoPage";
    }

    //新增LocationStoreInfo動作
    @PostMapping("/location/locationManager/addLocationStoreInfo/post")
    public String postLocationStoreInfo(@ModelAttribute("locationStoreInfo") Location lsi, Model model) {
        locationListService.addLocationStoreInfo(lsi);
        model.addAttribute("locationStoreInfo", new Location());
        return "location/addLocationStoreInfoPage";
    }


    //刪除LocationStoreInfo BY ID





//    ========================Show Location List===============================

    //page分頁功能

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
