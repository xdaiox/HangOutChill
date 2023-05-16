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

import java.util.ArrayList;
import java.util.List;

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
    public LocationFavorite addFavoriteLocationByLocationId(@RequestParam(name = "locationInfoId")Integer locId, @RequestParam(name = "memberId")Integer memberId){
        LocationInfo locationInfoById = locationInfoService.findLocationInfoById(locId);
        NormalMember member = normalMemberService.findNormalMemberById(memberId);
        LocationFavorite locationFavorite = new LocationFavorite();
        locationFavorite.setLocationInfo(locationInfoById);
        locationFavorite.setNormalMember(member);
        locationFavoriteService.addLocationFavorite(locationFavorite);
        List<LocationFavorite> favoritesLocationList= new ArrayList<>();
        favoritesLocationList.add(locationFavorite);
        return locationFavorite;
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

}
