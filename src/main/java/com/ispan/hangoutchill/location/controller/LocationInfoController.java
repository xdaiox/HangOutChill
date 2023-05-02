package com.ispan.hangoutchill.location.controller;

import com.ispan.hangoutchill.location.model.LocationComment;
import com.ispan.hangoutchill.location.model.LocationInfo;
import com.ispan.hangoutchill.location.service.LocationCommentService;
import com.ispan.hangoutchill.location.service.LocationInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LocationInfoController {

    @Autowired
    private LocationInfoService locationInfoService;
    private LocationCommentService locationCommentService;


//    ========================Admin LocationInfoManager 地點資料管理(後台)===============================

    //顯示所有LocationInfo 透過page 即LocationInfo Manager畫面
    @GetMapping("/location/locationManager")
    public String showAllLocationInfo(@RequestParam(name ="p" ,defaultValue = "1") Integer pageNumber,Model model){
        Page<LocationInfo> page = locationInfoService.findAllLocationInfoByPage(pageNumber);
        model.addAttribute("page", page);
        return "/location/locationManager";
    }

    //顯示單一LocationInfo BY ID
    @GetMapping("/location/locationManager/locationInfo/{id}")
    public String showDetailLocationInfo(@RequestParam(name = "locId") Integer locId, Model model){
        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locId);
        model.addAttribute("locId", locId);
        return "/location/locationInfoDetail";
    }

    //前往新增LocationInfo頁面
    @GetMapping("/location/locationManager/addLocationInfo")
    public String toAddLocationInfo(Model model) {
        model.addAttribute("locationInfo", new LocationInfo());
        return "/location/locationInfoAdd";
    }

    //新增LocationStoreInfo動作
    @PostMapping("/location/locationManager/addLocationInfo/post")
    public String postLocationInfo(@ModelAttribute("locationInfo") LocationInfo locationInfo, Model model) {
        locationInfoService.addLocationInfo(locationInfo);
        model.addAttribute("locationInfo", new LocationInfo());
        return "redirect:/location/locationInfoAdd";
    }

    //刪除LocationInfo BY ID
    @DeleteMapping("/location/locationManager/delete")
    public String deleteLocationInfo(@RequestParam(name="locId") Integer locId){
        locationInfoService.deleteLocationInfoById(locId);
        return "redirect:/location/locationManager";
    }

    //編輯LocationInfo BY ID


    //查看該地點所有評論 find all comment by locationInfo Id

    //刪除該地點評論By comment id


    //搜尋功能 By name





}
