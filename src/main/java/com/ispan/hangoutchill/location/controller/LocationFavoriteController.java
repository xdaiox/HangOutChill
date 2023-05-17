package com.ispan.hangoutchill.location.controller;


import com.ispan.hangoutchill.location.model.LocationFavorite;
import com.ispan.hangoutchill.location.model.LocationInfo;
import com.ispan.hangoutchill.location.service.LocationFavoriteService;
import com.ispan.hangoutchill.location.service.LocationInfoService;
import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
public class LocationFavoriteController {

    @Autowired
    LocationFavoriteService locationFavoriteService;

    @Autowired
    LocationInfoService locationInfoService;

    @Autowired
    NormalMemberService normalMemberService;

    @ResponseBody
    @PostMapping("/normalMember/addFavoriteLocation")
    public boolean addFavoriteLocationByLocationId(@CurrentSecurityContext(expression = "authentication") Authentication authentication, @RequestParam(name = "locationInfoId")Integer locId, Model model) {
        LocationInfo locationInfoById = locationInfoService.findLocationInfoById(locId);
        String name = authentication.getName();
        NormalMember currentMember = normalMemberService.findNormalUserByAccount(name);
        LocationFavorite locationFavorite = new LocationFavorite();
        locationFavorite.setLocationInfo(locationInfoById);
        locationFavorite.setNormalMember(currentMember);
        locationFavoriteService.addLocationFavorite(locationFavorite);
        model.addAttribute("result", currentMember);
        boolean b = locationFavoriteService.findAddedLocationFavorite(currentMember.getId(), locId);
        return  b;
    }


    @GetMapping("/normalMember/showFavoriteLocation")
    public  String findFavoriteByMemberId(@CurrentSecurityContext(expression = "authentication") Authentication authentication, Model model, Model model2){
        String name = authentication.getName();
        NormalMember currentMember = normalMemberService.findNormalUserByAccount(name);
        List<LocationFavorite> favoriteLocationByMemberId = locationFavoriteService.findFavoriteLocationByMemberId(currentMember.getId());
        model.addAttribute("favoriteLocation",favoriteLocationByMemberId);
        model2.addAttribute("result",currentMember);
        return "location/locationInfoFront/locationFavorite";
    }

    @ResponseBody
    @DeleteMapping("/normalMember/deleteFavoriteLocation")
    public boolean deleteFavoriteByFavoriteId(@RequestParam(name = "favoriteId")Integer id){
       return locationFavoriteService.deleteFavoriteById(id);
    }


    @ResponseBody
    @GetMapping("/normalMember/findFavoriteExisted")
    public boolean findLocationFavoriteExisted(@RequestParam(name="locId")Integer locationId, @CurrentSecurityContext(expression = "authentication") Authentication authentication){
        String name = authentication.getName();
        NormalMember currentMember = normalMemberService.findNormalUserByAccount(name);
        boolean b = locationFavoriteService.findAddedLocationFavorite(currentMember.getId(), locationId);
        return  b;
    }

//    @ResponseBody
//    @GetMapping("/normalMember/findFavoriteExisted")
//    public boolean findLocationFavoriteExisted(@RequestParam(name="locId")Integer locationId, @RequestParam(name="memberId")Integer memberId){
//        boolean b = locationFavoriteService.findAddedLocationFavorite(memberId, locationId);
//        return  b;
//    }

    @ResponseBody
    @DeleteMapping("/normalMenber/deleteFavoriteLocationBySingle")
    public  boolean deleteFavoriteLocation(@RequestParam(name="locId")Integer locationId, @CurrentSecurityContext(expression = "authentication") Authentication authentication){
        String name = authentication.getName();
        NormalMember currentMember = normalMemberService.findNormalUserByAccount(name);
        System.out.println(currentMember.getId());
        System.out.println(locationId);
       return locationFavoriteService.deleteFavoriteByMemberIdAndLocationId(currentMember.getId(), locationId);
    }

}
