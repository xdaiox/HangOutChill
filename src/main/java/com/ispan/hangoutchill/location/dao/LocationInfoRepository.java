package com.ispan.hangoutchill.location.dao;

import com.ispan.hangoutchill.location.dto.locationInfo.LocationInfoRequest;
import com.ispan.hangoutchill.location.model.LocationInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.persistence.criteria.*;
import java.util.List;

public interface LocationInfoRepository extends JpaRepository<LocationInfo, Integer>, JpaSpecificationExecutor<LocationInfo> {


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





//    ======================多條件測試=============================================
//    Specification<LocationInfo> Specification = new Specification<LocationInfo>() {
//        private static final long serialVersionUID = 1L;
//        @Override
//        public Predicate toPredicate(Root<LocationInfo> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
//            String name = LocationInfoRequest.get
//
//
//
//            return null;
//        }
//    }







}
