package com.ispan.hangoutchill.location.dao;

import com.ispan.hangoutchill.location.model.LocationInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.persistence.criteria.From;
import java.util.List;

public interface LocationInfoRepository extends JpaRepository<LocationInfo, Integer> {


    //搜尋 地點名稱 模糊搜尋
//    @Query("from LocationInfo where locName like  %:name% ")
//    public List<LocationInfo> findLocationInfoByLocNameLike(@Param("name") String locName);

    //搜尋 動態多條件查詢
//    @Query("from LocationInfo where (:name is null or locName like concat('%', :name, '%')) " +
//            "and (:category is null or locCat = :category) " +
//            "and (:price is null or locPriceLevel = :price) " +
//            "and (:city is null or locCity = :city) " +
//            "and (:dist is null or locDist = : dist)")
//
//    public Page<LocationInfo> searchLocationInfo(@Param("name") String name,
//                                                 @Param("category") String category,
//                                                 @Param("price") Integer price,
//                                                 @Param("city") String city,
//                                                 @Param("dist") String dist,
//                                                 Pageable pageable);


    @Query(value = "SELECT * FROM locationInfo " +
            "WHERE (:name IS NULL OR location_name LIKE CONCAT('%', :name, '%')) " +
            "AND (:category IS NULL OR location_category = :category) " +
            "AND (:price IS NULL OR location_priceLevel = :price) " +
            "AND (:city IS NULL OR location_city = :city) " +
            "AND (:dist IS NULL OR location_district = :dist)",
            countQuery = "SELECT COUNT(*) FROM locationInfo " +
                    "WHERE (:name IS NULL OR location_name LIKE CONCAT('%', :name, '%')) " +
                    "AND (:category IS NULL OR location_category = :category) " +
                    "AND (:price IS NULL OR location_priceLevel = :price) " +
                    "AND (:city IS NULL OR location_city = :city) " +
                    "AND (:dist IS NULL OR location_district = :dist)",
            nativeQuery = true)
    public Page<LocationInfo> searchLocationInfo(
            @Param("name") String name,
            @Param("category") String category,
            @Param("price") Integer price,
            @Param("city") String city,
            @Param("dist") String dist,
            Pageable pageable);




}
