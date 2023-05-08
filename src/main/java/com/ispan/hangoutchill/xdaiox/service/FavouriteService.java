package com.ispan.hangoutchill.xdaiox.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.hangoutchill.xdaiox.dao.FavouriteRepository;
import com.ispan.hangoutchill.xdaiox.model.Favourite;

@Service
public class FavouriteService {
	
	@Autowired
	private FavouriteRepository fvtRepository;
	
	public void addFavourite(Favourite fvt) {
		fvtRepository.save(fvt);
		}
	}
