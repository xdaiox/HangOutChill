package com.ispan.hangoutchill.location.service;


import com.ispan.hangoutchill.location.dao.LocationFavoriteRepository;
import com.ispan.hangoutchill.location.model.LocationFavorite;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class LocationFavoriteService {

    @Autowired
    LocationFavoriteRepository favoriteRepository;

    public void addLocationFavorite(LocationFavorite locationFavorite){
        favoriteRepository.save(locationFavorite);
    }

    public List<LocationFavorite> findFavoriteLocationByMemberId(Integer memberId){
       return favoriteRepository.findLocationFavoriteByMemberId(memberId);
    }

    public boolean deleteFavoriteById(Integer id){
        favoriteRepository.deleteById(id);
        Optional<LocationFavorite> byId = favoriteRepository.findById(id);
      if(byId.isEmpty()){
          return true;
      }else {
          return false;
      }
    }


}
