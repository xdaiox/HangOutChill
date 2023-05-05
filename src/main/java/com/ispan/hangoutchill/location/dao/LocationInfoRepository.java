package com.ispan.hangoutchill.location.dao;

import com.ispan.hangoutchill.location.model.LocationInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.persistence.criteria.From;
import java.util.List;

public interface LocationInfoRepository extends JpaRepository<LocationInfo,Integer>  {


    //搜尋 地點名稱 模糊搜尋
    @Query("from LocationInfo where locName like  %:locName% ")
    public List<LocationInfo> findLocationInfoByLocNameLike(@Param(value = "locName") String locName);

    //搜尋 地點分類 搜尋地點分類
//    @Query("from LocationInfo where lo")
}
