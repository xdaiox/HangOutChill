package com.ispan.hangoutchill.xdaiox.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.xdaiox.dao.FavouriteRepository;
import com.ispan.hangoutchill.xdaiox.model.Favourite;
import com.ispan.hangoutchill.xdaiox.model.FavouriteDTO;

@Service
public class FavouriteService {
	
	@Autowired
	private FavouriteRepository favRepository;
	
	public void addFavourite(Favourite fvt,NormalMember result) {
		fvt.setAddNormalMember(result);
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
	public List<Favourite> findAllFavouriteById(Integer normalMemberId) {
	    List<Favourite> favourites = favRepository.findAllByAddNormalMemberId(normalMemberId);
	    
//	    List<FavouriteDTO> favouriteDTOs = new ArrayList<>();
//	    
//	    for (Favourite favourite : favourites) {
//	        favouriteDTOs.add(convertToFavouriteDTO(favourite));
//	    }
	    
	    return favourites;
	}
	
	
	public FavouriteDTO convertToFavouriteDTO(Favourite favourite) {
	    FavouriteDTO favouriteDTO = new FavouriteDTO();
	    favouriteDTO.setId(favourite.getId());
	    favouriteDTO.setDiscussions(favourite.getDiscussions().getD_id());
	    favouriteDTO.setNormalMember(favourite.getNormalMember().getId());
	    favouriteDTO.setPostDate(favourite.getPostDate());
	    favouriteDTO.setAddNormalMember(favourite.getAddNormalMember().getId());
	    return favouriteDTO;
	}
}
