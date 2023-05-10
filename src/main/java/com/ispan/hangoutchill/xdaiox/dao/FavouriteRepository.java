package com.ispan.hangoutchill.xdaiox.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.hangoutchill.xdaiox.model.Favourite;

public interface FavouriteRepository extends JpaRepository<Favourite, Integer> {
    public List<Favourite> findAllByNormalMemberId(Integer id);
}
