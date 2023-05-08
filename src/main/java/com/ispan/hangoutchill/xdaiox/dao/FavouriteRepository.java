package com.ispan.hangoutchill.xdaiox.dao;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.xdaiox.model.Favourite;

public interface FavouriteRepository extends JpaRepository<Favourite, Integer> {
    public List<Favourite> findAllByNormalMemberId(Integer id);
}
