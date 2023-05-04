package com.ispan.hangoutchill.location.controller;

import com.ispan.hangoutchill.location.dao.LocationInfoRepository;
import com.ispan.hangoutchill.location.model.LocationComment;
import com.ispan.hangoutchill.location.model.LocationImage;
import com.ispan.hangoutchill.location.model.LocationInfo;
import com.ispan.hangoutchill.location.model.LocationOperationTime;
import com.ispan.hangoutchill.location.service.LocationCommentService;
import com.ispan.hangoutchill.location.service.LocationInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

@Controller
public class LocationInfoController {

    @Autowired
    private LocationInfoService locationInfoService;
    @Autowired
    private LocationInfoRepository locationInfoRepository;



//    ========================Admin LocationInfoManager 地點資料管理(後台)===============================

    //顯示所有LocationInfo 透過page 即LocationInfo Manager畫面
    @GetMapping("/location/locationManager")
    public String showAllLocationInfo(@RequestParam(name ="p" ,defaultValue = "1") Integer pageNumber,Model model){
        Page<LocationInfo> page = locationInfoService.findAllLocationInfoByPage(pageNumber);
        model.addAttribute("page", page);
        return "/location/locationManager";
    }

    //顯示單一LocationInfo BY ID
    @GetMapping("/location/locationManager/locationInfo")
    public String showDetailLocationInfo(@RequestParam(name = "locId") Integer locId, Model model){
        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locId);
        model.addAttribute("locId", locId);
        return "/location/locationInfoDetail";
    }

    //前往新增LocationInfo頁面
    @GetMapping("/location/locationManager/addPage")
    public String toAddLocationInfo(Model model) {
        model.addAttribute("locationInfo", new LocationInfo());
        return "/location/locationInfoAdd";
    }

    //新增LocationInfo動作    等待上傳圖片處理
    @PostMapping("/location/locationManager/addPage/post")
    public String postAddLocationInfo(@ModelAttribute("locationInfo") LocationInfo locationInfo, Model model)  {

//        LocationImage locationImage = new LocationImage();
//        locationImage.setLocImgMain(imageFile.getBytes());
//        locationImage.setLocImgGallery_1(imageFile.getBytes());
//        locationImage.setLocImgGallery_2(imageFile.getBytes());
//        locationImage.setLocImgGallery_3(imageFile.getBytes());
//        locationImage.setLocImgGallery_4(imageFile.getBytes());
//        locationImage.setLocImgGallery_5(imageFile.getBytes());
//        locationImage.setLocImgGallery_6(imageFile.getBytes());
//        locationImage.setLocImgGallery_7(imageFile.getBytes());
//        locationImage.setLocImgGallery_8(imageFile.getBytes());

//        locationInfo.setLocationImage(locationImage);

        locationInfoService.addLocationInfo(locationInfo);
        model.addAttribute("locationInfo", new LocationInfo());
        return "redirect:/location/locationManager";
    }

    //刪除LocationInfo BY ID
    @DeleteMapping("/location/locationManager/delete")
    public String deleteLocationInfo(@RequestParam(name="locId") Integer locId){
        locationInfoService.deleteLocationInfoById(locId);
        return "redirect:/location/locationManager";
    }

    //前往編輯LocationInfo頁面
    @GetMapping("/location/locationManager/editPage")
    public String toEditLocationInfo(@RequestParam("locId") Integer locId,Model model){
        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locId);
        model.addAttribute("locationInfo", locationInfo);

        return "location/locationInfoEdit";
    }

    //編輯LocationInfo動作
    @PutMapping("/location/locationManager/editPage")
    public String putEditLocationInfo(@ModelAttribute("locationInfo") LocationInfo locationInfo){
        locationInfoService.updateLocationInfoById(locationInfo.getLocId(), locationInfo);
        return "redirect:/location/locationManager";
    }

    //搜索BY locName
//    @GetMapping("/location/locationManager/findByName")
//    public String findLocationInfoByLocName(@RequestParam(name ="p" ,defaultValue = "1") Integer pageNumber,Model model){
//
//    }

    @GetMapping("/location/locationManager/findByName")
    public List<LocationInfo> findLocationInfoByLocName(@RequestParam("locName") String locName){
        return locationInfoRepository.findLocationInfoByLocName(locName);
    }



//    @GetMapping("/location/locationManager")
//    public String showAllLocationInfo(@RequestParam(name ="p" ,defaultValue = "1") Integer pageNumber,Model model){
//        Page<LocationInfo> page = locationInfoService.findAllLocationInfoByPage(pageNumber);
//        model.addAttribute("page", page);
//        return "/location/locationManager";
//    }

//============================================================================


    //LocationDetail view 預覽測試
    @GetMapping("/location/locationList/detail/test")
    public String toDetailLocationInfoTEST(){
        return "/location/locationInfoDetailTest";
    }



    //查看該地點所有評論 find all comment by locationInfo Id

    //刪除該地點評論By comment id


    //搜尋功能 By name









}
