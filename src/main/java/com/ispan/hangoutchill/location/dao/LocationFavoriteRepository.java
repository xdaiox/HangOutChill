package com.ispan.hangoutchill.location.dao;

import com.ispan.hangoutchill.location.model.LocationFavorite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface LocationFavoriteRepository extends JpaRepository<LocationFavorite, Integer> {

    @Query(value ="from LocationFavorite  where normalMember.id = :memberId")
     List<LocationFavorite> findLocationFavoriteByMemberId(@Param(value = "memberId")Integer memberId);

}
