package com.ispan.hangoutchill.xdaiox.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.hangoutchill.xdaiox.dao.FavouriteRepository;
import com.ispan.hangoutchill.xdaiox.model.Favourite;
import com.ispan.hangoutchill.xdaiox.model.FavouriteDTO;

@Service
public class FavouriteService {
	
	@Autowired
	private FavouriteRepository favRepository;
	
	public void addFavourite(Favourite fvt) {
		favRepository.save(fvt);
		
		}
	
//	public List<Favourite> findAllFavouriteById(Integer id){
//		Set<Integer> ids = new HashSet<>();
//	    ids.add(id);
//		System.out.println("========================at Service=========================="+"id :"+id+"==================================================");
//
//	    List<Favourite> fav = favRepository.findAllByNormalMemberId(id);
//		return fav;
//	}
//	
	public List<FavouriteDTO> findAllFavouriteById(Integer normalMemberId) {
	    List<Favourite> favourites = favRepository.findAllByNormalMemberId(normalMemberId);
	    List<FavouriteDTO> favouriteDTOs = new ArrayList<>();
	    
	    for (Favourite favourite : favourites) {
	        favouriteDTOs.add(convertToFavouriteDTO(favourite));
	    }
	    
	    return favouriteDTOs;
	}
	
	
	public FavouriteDTO convertToFavouriteDTO(Favourite favourite) {
	    FavouriteDTO favouriteDTO = new FavouriteDTO();
	    favouriteDTO.setId(favourite.getId());
	    favouriteDTO.setDiscussions(favourite.getDiscussions().getD_id());
	    favouriteDTO.setNormalMember(favourite.getNormalMember().getId());
	    favouriteDTO.setPostDate(favourite.getPostDate());
	    return favouriteDTO;
	}
}
