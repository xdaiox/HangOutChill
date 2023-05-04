package com.ispan.hangoutchill.location.dao;

import com.ispan.hangoutchill.location.model.LocationInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface LocationInfoRepository extends JpaRepository<LocationInfo,Integer>  {

    @Query("FROM LocationInfo where locName = :locName ")
    public List<LocationInfo> findLocationInfoByLocName(@Param(value = "locName") String locName);
}
