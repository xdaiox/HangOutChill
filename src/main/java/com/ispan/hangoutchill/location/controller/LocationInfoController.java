package com.ispan.hangoutchill.location.controller;

import com.ispan.hangoutchill.location.dao.LocationInfoRepository;

import com.ispan.hangoutchill.location.model.LocationInfo;


import com.ispan.hangoutchill.location.service.LocationInfoService;
import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LocationInfoController {

    @Autowired
    private LocationInfoService locationInfoService;
    @Autowired
    private LocationInfoRepository locationInfoRepository;

    @Autowired
    NormalMemberService nMemberService;


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
//    @GetMapping("/location/locationManager/locationInfo")
//    public String showDetailLocationInfo(@CurrentSecurityContext(expression = "authentication") Authentication authentication,
//                                         @RequestParam(name = "locId") Integer locId, Model model) {
//
//        String name = authentication.getName();
//        NormalMember result = nMemberService.findNormalUserByAccount(name);
//        model.addAttribute("result", result);
//
//        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locId);
//        model.addAttribute("locId", locId);
//        return "location/locationInfoBack/locationInfoDetail";
//    }


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
        locationInfoService.addLocationImagCover(locationInfo);
        locationInfoService.addLocationImagG1(locationInfo);
        locationInfoService.addLocationImagG2(locationInfo);
        locationInfoService.addLocationImagG3(locationInfo);
        locationInfoService.addLocationImagG4(locationInfo);
        locationInfoService.addLocationImagG5(locationInfo);
        locationInfoService.addLocationImagG6(locationInfo);
        locationInfoService.addLocationImagG7(locationInfo);
        locationInfoService.addLocationImagG8(locationInfo);

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
        //處理圖片cover
        MultipartFile imagCover = locationInfo.getLocationImage().getImagCover();
        if (imagCover != null && !imagCover.isEmpty()) {
            try {
                byte[] bytes = imagCover.getBytes();
                locationInfo.getLocationImage().setLocImgCover(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgCover(originalLocationInfo.getLocationImage().getLocImgCover());
        }

        //處理圖片G1
        MultipartFile imagG1 = locationInfo.getLocationImage().getImagG1();
        if (imagG1 != null && !imagG1.isEmpty()) {
            try {
                byte[] bytes = imagG1.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_1(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgGallery_1(originalLocationInfo.getLocationImage().getLocImgGallery_1());
        }

        //處理圖片G2
        MultipartFile imagG2 = locationInfo.getLocationImage().getImagG2();
        if (imagG2 != null && !imagG2.isEmpty()) {
            try {
                byte[] bytes = imagG2.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_2(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgGallery_2(originalLocationInfo.getLocationImage().getLocImgGallery_2());
        }

        //處理圖片G3
        MultipartFile imagG3 = locationInfo.getLocationImage().getImagG3();
        if (imagG3 != null && !imagG3.isEmpty()) {
            try {
                byte[] bytes = imagG3.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_3(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgGallery_3(originalLocationInfo.getLocationImage().getLocImgGallery_3());
        }

        //處理圖片G4
        MultipartFile imagG4 = locationInfo.getLocationImage().getImagG4();
        if (imagG4 != null && !imagG4.isEmpty()) {
            try {
                byte[] bytes = imagG4.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_4(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgGallery_4(originalLocationInfo.getLocationImage().getLocImgGallery_4());
        }

        //處理圖片G5
        MultipartFile imagG5 = locationInfo.getLocationImage().getImagG5();
        if (imagG5 != null && !imagG5.isEmpty()) {
            try {
                byte[] bytes = imagG5.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_5(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgGallery_5(originalLocationInfo.getLocationImage().getLocImgGallery_5());
        }

        //處理圖片G6
        MultipartFile imagG6 = locationInfo.getLocationImage().getImagG6();
        if (imagG6 != null && !imagG6.isEmpty()) {
            try {
                byte[] bytes = imagG6.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_6(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgGallery_6(originalLocationInfo.getLocationImage().getLocImgGallery_6());
        }

        //處理圖片G7
        MultipartFile imagG7 = locationInfo.getLocationImage().getImagG7();
        if (imagG7 != null && !imagG7.isEmpty()) {
            try {
                byte[] bytes = imagG7.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_7(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgGallery_7(originalLocationInfo.getLocationImage().getLocImgGallery_7());
        }

        //處理圖片G8
        MultipartFile imagG8 = locationInfo.getLocationImage().getImagG8();
        if (imagG3 != null && !imagG8.isEmpty()) {
            try {
                byte[] bytes = imagG8.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_8(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgGallery_8(originalLocationInfo.getLocationImage().getLocImgGallery_8());
        }

        locationInfoService.updateLocationInfoById(locationInfo.getLocId(), locationInfo);
        return "redirect:/location/locationManager";
    }


    //後台上下架功能
    @Transactional
    @GetMapping("/location/locationManager/status")
    public String changeLocationInfoStatus(@RequestParam("locId") Integer locId, Model model) {
        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locId);
        Boolean locStatus = locationInfo.getLocStatus();
        if (locStatus == true) {
            locationInfo.setLocStatus(false);
        } else {
            locationInfo.setLocStatus(true);
        }
        return "redirect:/location/locationManager";
    }


//===============================前台功能=============================================

//    前往地點清單首頁
    @GetMapping("/location/locationList")
    public String toLocationList(@CurrentSecurityContext(expression = "authentication") Authentication authentication,
                                 @RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {

        String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result", result);

        Page<LocationInfo> page = locationInfoService.findListAllLocationInfoByPage(pageNumber);
        model.addAttribute("page", page);

        return "location/locationInfoFront/locationList";
//        return "location/locationInfoTest/locationSearchTest";
    }




    //地點清單查詢包含多條件
    @ResponseBody
    @GetMapping("/location/locationList/search")
    public Map<String, Object> showAllLocationList(@CurrentSecurityContext(expression = "authentication") Authentication authentication,
                                                   @RequestParam(name = "pageNumber", defaultValue = "1") Integer pageNumber,
                                                   @RequestParam(name = "name", required = false) String name,
                                                   @RequestParam(name = "category", required = false) String category,
                                                   @RequestParam(name = "price", required = false) String price,
                                                   @RequestParam(name = "city", required = false) String city,
                                                   @RequestParam(name = "dist", required = false) String dist) {

        Page<LocationInfo> page;
        Map<String, Object> response = new HashMap<>();
        page = locationInfoService.findFrontAllLocationInfoByPage(name, category, price, city, dist, pageNumber);
        response.put("name", name);
        response.put("category", category);
        response.put("price", price);
        response.put("city", city);
        response.put("dist", dist);
        response.put("pageNumber", pageNumber);
        response.put("page", page);
        return response;
    }


    //查詢地點詳細資訊
    @GetMapping("/location/locationList/single")
    public String showLocationSingle(@CurrentSecurityContext(expression = "authentication") Authentication authentication,
                                     @RequestParam(name = "locId") Integer locId, Model model) {

        String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result", result);

        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locId);
        model.addAttribute("locationInfo", locationInfo);
        return "location/locationInfoFront/locationSingle";
    }


    //收藏地點功能


    //會員商家地點管理中心
    @GetMapping("/location/memberLocationInfo/locationManager")
    public String showAllMemberLocationInfo(@CurrentSecurityContext(expression = "authentication") Authentication authentication,
                                            @RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model model) {

        String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result", result);

        List<LocationInfo> locationByMemberId = locationInfoService.findLocationByMemberId(result.getId());
        model.addAttribute("locationInfo", locationByMemberId);
        return "location/locationInfoFront/memberLocationInfoManager";
    }


    //前往會員商家地點新增
    @GetMapping("/location/memberLocationInfo/addPage")
    public String toAddMemberLocationInfo(@CurrentSecurityContext(expression = "authentication") Authentication authentication,
                                          Model model) {

        String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result", result);

        model.addAttribute("locationInfo", new LocationInfo());
        return "location/locationInfoFront/memberLocationInfoAdd";
    }

    //會員商家地點新增動作
    @PostMapping("/location/memberLocationInfo/addPage/post")
    public String postAddMemberLocationInfo(@ModelAttribute("locationInfo") LocationInfo locationInfo, Model model) {


        //處理圖片
        locationInfoService.addLocationImagCover(locationInfo);
        locationInfoService.addLocationImagG1(locationInfo);
        locationInfoService.addLocationImagG2(locationInfo);
        locationInfoService.addLocationImagG3(locationInfo);
        locationInfoService.addLocationImagG4(locationInfo);
        locationInfoService.addLocationImagG5(locationInfo);
        locationInfoService.addLocationImagG6(locationInfo);
        locationInfoService.addLocationImagG7(locationInfo);
        locationInfoService.addLocationImagG8(locationInfo);

        locationInfoService.addLocationInfo(locationInfo);
        model.addAttribute("locationInfo", new LocationInfo());

        return "redirect:/location/memberLocationInfo/locationManager";

    }


    //會員商家地點刪除
    @DeleteMapping("/location/memberLocationInfo/delete")
    public String deleteMemberLocationInfo(@CurrentSecurityContext(expression = "authentication") Authentication authentication,
                                           @RequestParam(name = "locId") Integer locId) {

//        String name = authentication.getName();
//        NormalMember result = nMemberService.findNormalUserByAccount(name);
//        model.addAttribute("result", result);


        locationInfoService.deleteLocationInfoById(locId);
        return "redirect:/location/memberLocationInfo/locationManager";
    }


    //會員商家編輯
    @GetMapping("/location/memberLocationInfo/editPage")
    public String toEditMemberLocationInfo(@CurrentSecurityContext(expression = "authentication") Authentication authentication,
                                           @RequestParam("locId") Integer locId, Model model) {

        String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result", result);

        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locId);
        model.addAttribute("locationInfo", locationInfo);

        return "location/locationInfoFront/memberLocationInfoEdit";
    }

    //編輯LocationInfo動作
    @PutMapping("/location/memberLocationInfo/editPage")
    public String putEditMemberLocationInfo(@ModelAttribute("locationInfo") LocationInfo locationInfo) {


        //處理圖片cover
        MultipartFile imagCover = locationInfo.getLocationImage().getImagCover();
        if (imagCover != null && !imagCover.isEmpty()) {
            try {
                byte[] bytes = imagCover.getBytes();
                locationInfo.getLocationImage().setLocImgCover(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgCover(originalLocationInfo.getLocationImage().getLocImgCover());
        }

        //處理圖片G1
        MultipartFile imagG1 = locationInfo.getLocationImage().getImagG1();
        if (imagG1 != null && !imagG1.isEmpty()) {
            try {
                byte[] bytes = imagG1.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_1(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgGallery_1(originalLocationInfo.getLocationImage().getLocImgGallery_1());
        }

        //處理圖片G2
        MultipartFile imagG2 = locationInfo.getLocationImage().getImagG2();
        if (imagG2 != null && !imagG2.isEmpty()) {
            try {
                byte[] bytes = imagG2.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_2(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgGallery_2(originalLocationInfo.getLocationImage().getLocImgGallery_2());
        }

        //處理圖片G3
        MultipartFile imagG3 = locationInfo.getLocationImage().getImagG3();
        if (imagG3 != null && !imagG3.isEmpty()) {
            try {
                byte[] bytes = imagG3.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_3(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgGallery_3(originalLocationInfo.getLocationImage().getLocImgGallery_3());
        }

        //處理圖片G4
        MultipartFile imagG4 = locationInfo.getLocationImage().getImagG4();
        if (imagG4 != null && !imagG4.isEmpty()) {
            try {
                byte[] bytes = imagG4.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_4(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgGallery_4(originalLocationInfo.getLocationImage().getLocImgGallery_4());
        }

        //處理圖片G5
        MultipartFile imagG5 = locationInfo.getLocationImage().getImagG5();
        if (imagG5 != null && !imagG5.isEmpty()) {
            try {
                byte[] bytes = imagG5.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_5(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgGallery_5(originalLocationInfo.getLocationImage().getLocImgGallery_5());
        }

        //處理圖片G6
        MultipartFile imagG6 = locationInfo.getLocationImage().getImagG6();
        if (imagG6 != null && !imagG6.isEmpty()) {
            try {
                byte[] bytes = imagG6.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_6(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgGallery_6(originalLocationInfo.getLocationImage().getLocImgGallery_6());
        }

        //處理圖片G7
        MultipartFile imagG7 = locationInfo.getLocationImage().getImagG7();
        if (imagG7 != null && !imagG7.isEmpty()) {
            try {
                byte[] bytes = imagG7.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_7(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgGallery_7(originalLocationInfo.getLocationImage().getLocImgGallery_7());
        }

        //處理圖片G8
        MultipartFile imagG8 = locationInfo.getLocationImage().getImagG8();
        if (imagG3 != null && !imagG8.isEmpty()) {
            try {
                byte[] bytes = imagG8.getBytes();
                locationInfo.getLocationImage().setLocImgGallery_8(bytes);
            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        } else {
            LocationInfo originalLocationInfo = locationInfoService.findLocationInfoById(locationInfo.getLocId());
            locationInfo.getLocationImage().setLocImgGallery_8(originalLocationInfo.getLocationImage().getLocImgGallery_8());
        }

        locationInfoService.updateLocationInfoById(locationInfo.getLocId(), locationInfo);
        return "redirect:/location/memberLocationInfo/locationManager";
    }

    //前台上下架功能
    @Transactional
    @GetMapping("/location/memberLocationInfo/locationManager/status")
    public String changeMemberLocationInfoStatus(@RequestParam("locId") Integer locId, Model model) {

        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locId);
        Boolean locStatus = locationInfo.getLocStatus();
        if (locStatus == true) {
            locationInfo.setLocStatus(false);
        } else {
            locationInfo.setLocStatus(true);
        }
        return "redirect:/location/memberLocationInfo/locationManager";
    }


    //===============================取得locationInfo圖片=============================================
    //取得imgcover
    @GetMapping("/locationInfo/getImgCover/{locationId}")
    public ResponseEntity<byte[]> getImgCover(HttpServletResponse resp, @PathVariable Integer locationId) {

        HttpHeaders headers = new HttpHeaders();
        byte[] media = null;

        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locationId);


        if (locationInfo != null) {
            byte[] imageBytes = locationInfo.getLocationImage().getLocImgCover();
            if (imageBytes != null) {
                media = imageBytes;
            }
        }

        headers.setCacheControl(CacheControl.noCache().getHeaderValue());
        MediaType mediaType = MediaType.valueOf("image/png");
        headers.setContentType(mediaType);
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
        return responseEntity;
    }

    //取得imgG1
    @GetMapping("/locationInfo/getImgG1/{locationId}")
    public ResponseEntity<byte[]> getImgG1(HttpServletResponse resp, @PathVariable Integer locationId) {

        HttpHeaders headers = new HttpHeaders();
        byte[] media = null;

        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locationId);


        if (locationInfo != null) {
            byte[] imageBytes = locationInfo.getLocationImage().getLocImgGallery_1();
            if (imageBytes != null) {
                media = imageBytes;
            }
        }

        headers.setCacheControl(CacheControl.noCache().getHeaderValue());
        MediaType mediaType = MediaType.valueOf("image/png");
        headers.setContentType(mediaType);
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
        return responseEntity;
    }


    //取得imgG2
    @GetMapping("/locationInfo/getImgG2/{locationId}")
    public ResponseEntity<byte[]> getImgG2(HttpServletResponse resp, @PathVariable Integer locationId) {

        HttpHeaders headers = new HttpHeaders();
        byte[] media = null;

        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locationId);


        if (locationInfo != null) {
            byte[] imageBytes = locationInfo.getLocationImage().getLocImgGallery_2();
            if (imageBytes != null) {
                media = imageBytes;
            }
        }

        headers.setCacheControl(CacheControl.noCache().getHeaderValue());
        MediaType mediaType = MediaType.valueOf("image/png");
        headers.setContentType(mediaType);
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
        return responseEntity;
    }

    //取得imgG3
    @GetMapping("/locationInfo/getImgG3/{locationId}")
    public ResponseEntity<byte[]> getImgG3(HttpServletResponse resp, @PathVariable Integer locationId) {

        HttpHeaders headers = new HttpHeaders();
        byte[] media = null;

        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locationId);


        if (locationInfo != null) {
            byte[] imageBytes = locationInfo.getLocationImage().getLocImgGallery_3();
            if (imageBytes != null) {
                media = imageBytes;
            }
        }

        headers.setCacheControl(CacheControl.noCache().getHeaderValue());
        MediaType mediaType = MediaType.valueOf("image/png");
        headers.setContentType(mediaType);
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
        return responseEntity;
    }

    //取得imgG4
    @GetMapping("/locationInfo/getImgG4/{locationId}")
    public ResponseEntity<byte[]> getImgG4(HttpServletResponse resp, @PathVariable Integer locationId) {

        HttpHeaders headers = new HttpHeaders();
        byte[] media = null;

        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locationId);


        if (locationInfo != null) {
            byte[] imageBytes = locationInfo.getLocationImage().getLocImgGallery_4();
            if (imageBytes != null) {
                media = imageBytes;
            }
        }

        headers.setCacheControl(CacheControl.noCache().getHeaderValue());
        MediaType mediaType = MediaType.valueOf("image/png");
        headers.setContentType(mediaType);
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
        return responseEntity;
    }

    //取得imgG5
    @GetMapping("/locationInfo/getImgG5/{locationId}")
    public ResponseEntity<byte[]> getImgG5(HttpServletResponse resp, @PathVariable Integer locationId) {

        HttpHeaders headers = new HttpHeaders();
        byte[] media = null;

        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locationId);


        if (locationInfo != null) {
            byte[] imageBytes = locationInfo.getLocationImage().getLocImgGallery_5();
            if (imageBytes != null) {
                media = imageBytes;
            }
        }

        headers.setCacheControl(CacheControl.noCache().getHeaderValue());
        MediaType mediaType = MediaType.valueOf("image/png");
        headers.setContentType(mediaType);
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
        return responseEntity;
    }

    //取得imgG6
    @GetMapping("/locationInfo/getImgG6/{locationId}")
    public ResponseEntity<byte[]> getImgG6(HttpServletResponse resp, @PathVariable Integer locationId) {

        HttpHeaders headers = new HttpHeaders();
        byte[] media = null;

        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locationId);


        if (locationInfo != null) {
            byte[] imageBytes = locationInfo.getLocationImage().getLocImgGallery_6();
            if (imageBytes != null) {
                media = imageBytes;
            }
        }

        headers.setCacheControl(CacheControl.noCache().getHeaderValue());
        MediaType mediaType = MediaType.valueOf("image/png");
        headers.setContentType(mediaType);
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
        return responseEntity;
    }

    //取得imgG7
    @GetMapping("/locationInfo/getImgG7/{locationId}")
    public ResponseEntity<byte[]> getImgG7(HttpServletResponse resp, @PathVariable Integer locationId) {

        HttpHeaders headers = new HttpHeaders();
        byte[] media = null;

        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locationId);


        if (locationInfo != null) {
            byte[] imageBytes = locationInfo.getLocationImage().getLocImgGallery_7();
            if (imageBytes != null) {
                media = imageBytes;
            }
        }

        headers.setCacheControl(CacheControl.noCache().getHeaderValue());
        MediaType mediaType = MediaType.valueOf("image/png");
        headers.setContentType(mediaType);
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
        return responseEntity;
    }

    //取得imgG8
    @GetMapping("/locationInfo/getImgG8/{locationId}")
    public ResponseEntity<byte[]> getImgG8(HttpServletResponse resp, @PathVariable Integer locationId) {

        HttpHeaders headers = new HttpHeaders();
        byte[] media = null;

        LocationInfo locationInfo = locationInfoService.findLocationInfoById(locationId);


        if (locationInfo != null) {
            byte[] imageBytes = locationInfo.getLocationImage().getLocImgGallery_8();
            if (imageBytes != null) {
                media = imageBytes;
            }
        }

        headers.setCacheControl(CacheControl.noCache().getHeaderValue());
        MediaType mediaType = MediaType.valueOf("image/png");
        headers.setContentType(mediaType);
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
        return responseEntity;
    }







//    ==========================測試==============================


//    @GetMapping("/location/locationListTest")
//    public String toLocationListTest() {
//        return "location/locationInfoTest/locationSearchTest";
//    }


//    @ResponseBody
//    @GetMapping("/location/locationManager/test")
//    public Page<LocationInfo> showAllLocationInfo(@RequestParam(name ="p" ,defaultValue = "1") Integer pageNumber,Model model){
//        Page<LocationInfo> page = locationInfoService.findListAllLocationInfoByPage(pageNumber);
//        model.addAttribute("page", page);
//        return page;
//    }


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


    //        測試 查詢所有上架地點
//    @ResponseBody
//    @GetMapping("/location/locationManager/test")
//    public Page<LocationInfo> showAllLocationInfo(@RequestParam(name ="p" ,defaultValue = "1") Integer pageNumber,Model model){
//        Page<LocationInfo> page = locationInfoService.findListAllLocationInfoByPage(pageNumber);
//        model.addAttribute("page", page);
//        return page;
//    }


    //        測試 查詢所有上架地點
//    @ResponseBody
//    @GetMapping("/location/locationManager/test")
//    public Page<LocationInfo> showAllLocationInfo(@RequestParam(name = "pageNumber", defaultValue = "1") Integer pageNumber,
//                                                  @RequestParam(name = "name", required = false) String name,
//                                                  @RequestParam(name = "category", required = false) String category,
//                                                  @RequestParam(name = "price", required = false) String price,
//                                                  @RequestParam(name = "city", required = false) String city,
//                                                  @RequestParam(name = "dist", required = false) String dist, Model model){
//        Page<LocationInfo> page = locationInfoService.findFrontAllLocationInfoByPage(name, category, price, city, dist, pageNumber);
//        model.addAttribute("page", page);
//        return page;
//    }


    //地點清單查詢(已上架) 不包含多條件
//    @GetMapping("/location/locationManager/test")
//    public Page<LocationInfo> showAllLocationInfo(@RequestParam(name ="p" ,defaultValue = "1") Integer pageNumber,Model model){
//        Page<LocationInfo> page = locationInfoService.findListAllLocationInfoByPage(pageNumber);
//        model.addAttribute("page", page);
//        return page;
//    }



//    @GetMapping ("/location/locationList")
//    public String toLocationList(@CurrentSecurityContext(expression = "authentication")Authentication authentication, Model model){
//
//        String name = authentication.getName();
//        NormalMember result = nMemberService.findNormalUserByAccount(name);
//        model.addAttribute("result", result);
//
//        return "location/locationInfoFront/locationList";
//    }


//    @GetMapping("/location/locationList/single")
//    public String toLocationSingle(){
//        return "location/locationInfoFront/locationSingle";
//    }


}
