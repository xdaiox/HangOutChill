package com.ispan.hangoutchill.location.controller;

import com.ispan.hangoutchill.location.dao.LocationInfoRepository;

import com.ispan.hangoutchill.location.model.LocationInfo;


import com.ispan.hangoutchill.location.service.LocationInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class LocationInfoController {

    @Autowired
    private LocationInfoService locationInfoService;
    @Autowired
    private LocationInfoRepository locationInfoRepository;


    //    ========================Admin LocationInfoManager 地點資料管理(後台)===============================

    //前往後臺地點清單管理
    @GetMapping("/location/locationManager")
    public String toLocationManager() {
        return "location/locationInfoBack/locationManagerAjax";
    }

    //後臺地點清單多條件查詢
    @ResponseBody
    @GetMapping("/location/locationManager/search")
    public Map<String, Object> showAllLocationInfo(@RequestParam(name = "pageNumber", defaultValue = "1") Integer pageNumber,
                                                   @RequestParam(name = "name", required = false) String name,
                                                   @RequestParam(name = "category", required = false) String category,
                                                   @RequestParam(name = "price", required = false) String price,
                                                   @RequestParam(name = "city", required = false) String city,
                                                   @RequestParam(name = "dist", required = false) String dist) {

        System.out.println("in controller");

        Page<LocationInfo> page;
        Map<String, Object> response = new HashMap<>();
        page = locationInfoService.findAllLocationInfoByPage(name, category, price, city, dist, pageNumber);
        response.put("name", name);
        response.put("category", category);
        response.put("price", price);
        response.put("city", city);
        response.put("dist", dist);
        response.put("pageNumber", pageNumber);
        response.put("page", page);
        return response;
    }





    //    顯示單一LocationInfo BY ID
    @GetMapping("/location/locationManager/locationInfo")
    public String showDetailLocationInfo(@RequestParam(name = "locId") Integer locId, Model model) {
        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locId);
        model.addAttribute("locId", locId);
        return "location/locationInfoBack/locationInfoDetail";
    }





    //前往新增LocationInfo頁面
    @GetMapping("/location/locationManager/addPage")
    public String toAddLocationInfo(Model model) {
        model.addAttribute("locationInfo", new LocationInfo());
        return "location/locationInfoBack/locationInfoAdd";
    }





    //新增LocationInfo動作    等待上傳圖片處理
    @PostMapping("/location/locationManager/addPage/post")
    public String postAddLocationInfo(@ModelAttribute("locationInfo") LocationInfo locationInfo, Model model) {

        //處理圖片
        locationInfoService.handleLocationImagCover(locationInfo);
        locationInfoService.handleLocationImagG1(locationInfo);
        locationInfoService.handleLocationImagG2(locationInfo);
        locationInfoService.handleLocationImagG3(locationInfo);
        locationInfoService.handleLocationImagG4(locationInfo);
        locationInfoService.handleLocationImagG5(locationInfo);
        locationInfoService.handleLocationImagG6(locationInfo);
        locationInfoService.handleLocationImagG7(locationInfo);
        locationInfoService.handleLocationImagG8(locationInfo);

        locationInfoService.addLocationInfo(locationInfo);
        model.addAttribute("locationInfo", new LocationInfo());
        return "redirect:/location/locationManager";
    }





    //刪除LocationInfo BY ID
    @DeleteMapping("/location/locationManager/delete")
    public String deleteLocationInfo(@RequestParam(name = "locId") Integer locId) {
        locationInfoService.deleteLocationInfoById(locId);
        return "redirect:/location/locationManager";
    }




    //前往編輯LocationInfo頁面
    @GetMapping("/location/locationManager/editPage")
    public String toEditLocationInfo(@RequestParam("locId") Integer locId, Model model) {
        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locId);
        model.addAttribute("locationInfo", locationInfo);

        return "location/locationInfoBack/locationInfoEdit";
    }





    //編輯LocationInfo動作
    @PutMapping("/location/locationManager/editPage")
    public String putEditLocationInfo(@ModelAttribute("locationInfo") LocationInfo locationInfo) {
        locationInfoService.updateLocationInfoById(locationInfo.getLocId(), locationInfo);
        return "redirect:/location/locationManager";
    }


//============================================================================











//    ==========================測試==============================

    //查詢地點詳細資訊
    @GetMapping("/location/locationList/single")
    public String toLocationDetail() {

        return "location/locationInfoBack/locationInfoDetail";
    }





    //地點清單首頁
    @GetMapping ("/location/locationList")
    public String toLocationList(){
        return "location/locationInfoFront/locationList";
    }

    //地點清單查詢包含多條件
    @ResponseBody
    @GetMapping("/location/locationList/search")
    public Map<String, Object> showAllLocationList(@RequestParam(name = "pageNumber", defaultValue = "1") Integer pageNumber,
                                                   @RequestParam(name = "name", required = false) String name,
                                                   @RequestParam(name = "category", required = false) String category,
                                                   @RequestParam(name = "price", required = false) String price,
                                                   @RequestParam(name = "city", required = false) String city,
                                                   @RequestParam(name = "dist", required = false) String dist) {

        Page<LocationInfo> page;
        Map<String, Object> response = new HashMap<>();
        page = locationInfoService.findAllLocationInfoByPage(name, category, price, city, dist, pageNumber);
        response.put("name", name);
        response.put("category", category);
        response.put("price", price);
        response.put("city", city);
        response.put("dist", dist);
        response.put("pageNumber", pageNumber);
        response.put("page", page);
        return response;
    }














//    ========================舊版資料===============================

//    顯示所有LocationInfo 透過page 即LocationInfo Manager畫面
//    @GetMapping("/location/locationManager")
//    public String showAllLocationInfo(@RequestParam(name ="p" ,defaultValue = "1") Integer pageNumber,Model model){
//        Page<LocationInfo> page = locationInfoService.findAllLocationInfoByPage(pageNumber);
//        model.addAttribute("page", page);
//        return "/location/locationManager";
//    }

    //顯示所有locationInfo 加入動態查詢功能
//    @GetMapping("/location/locationManager")
//    public String showAllLocationInfo(@RequestParam(name = "p" ,defaultValue = "1") Integer pageNumber,
//                                      @RequestParam(name = "name", required = false) String name,
//                                      @RequestParam(name = "category", required = false) String category,
//                                      @RequestParam(name = "price", required = false) Integer price,
//                                      @RequestParam(name = "city", required = false) String city,
//                                      @RequestParam(name = "dist", required = false) String dist,
//                                      Model model){
//        Page<LocationInfo> page = locationInfoService.findAllLocationInfoByPage(
//                pageNumber, name, category, price, city, dist);
//        model.addAttribute("page", page);
//        return "/location/locationManager";
//    }

    //    @ResponseBody
//    @PostMapping("/api/location/locationManager/search")
//    public  Page<LocationInfo> showAllLocationInfo(@RequestBody LocationInfoRequest locationInfoRequest){
//
//        Page<LocationInfo> page = locationInfoService.findAllLocationInfoByPage(locationInfoRequest.getName(),
//                locationInfoRequest.getCategory(), locationInfoRequest.getPrice(),locationInfoRequest.getCity(),
//                locationInfoRequest.getDist(),locationInfoRequest.getPageNumber());
//
//        return page;
//    }

//    @ResponseBody
//        @GetMapping ("/api/location/locationManager/search")
//        public  Page<LocationInfo> showAllLocationInfo(@RequestParam(name = "p" ,defaultValue = "1") Integer pageNumber,
//                @RequestParam(name = "name", required = false) String name,
//                @RequestParam(name = "category", required = false) String category,
//                @RequestParam(name = "price", required = false) Integer price,
//                @RequestParam(name = "city", required = false) String city,
//                @RequestParam(name = "dist", required = false) String dist){
//
//            Page<LocationInfo> page = locationInfoService.findAllLocationInfoByPage(name,category,price,city,dist,pageNumber);
//
//            return page;
//    }


//        顯示所有LocationInfo 透過page 即LocationInfo Manager畫面
//    @GetMapping("/location/locationManager")
//    public String showAllLocationInfo(@RequestParam(name = "p" ,defaultValue = "1") Integer pageNumber,
//                                      @RequestParam(name = "name", required = false) String name,
//                                      @RequestParam(name = "category", required = false) String category,
//                                      @RequestParam(name = "price", required = false) Integer price,
//                                      @RequestParam(name = "city", required = false) String city,
//                                      @RequestParam(name = "dist", required = false) String dist,
//                                      Model model){
//        Page<LocationInfo> page = locationInfoService.findAllLocationInfoByPage(name, category, price, city, dist, pageNumber);
//        model.addAttribute("page", page);
//        return "/location/locationManager";
//    }








}
