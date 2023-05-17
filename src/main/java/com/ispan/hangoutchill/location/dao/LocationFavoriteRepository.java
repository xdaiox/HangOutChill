package com.ispan.hangoutchill.location.dao;

import com.ispan.hangoutchill.location.model.LocationFavorite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface LocationFavoriteRepository extends JpaRepository<LocationFavorite, Integer> {

    @Query(value ="from LocationFavorite  where normalMember.id = :memberId")
     List<LocationFavorite> findLocationFavoriteByMemberId(@Param(value = "memberId")Integer memberId);

    @Query(value = "select* from [dbo].[LocationFavorite] where fk_member_id =:memberId  and fk_location_id =:locationId ",nativeQuery = true)
    LocationFavorite findLocationFavoriteByMemberIdAndLocationId(@Param(value = "memberId")Integer memberId, @Param(value="locationId")Integer locationId);


    @Modifying
    @Query(value = "DELETE FROM [dbo].[LocationFavorite] WHERE fk_member_id =:memberId  and fk_location_id=:locationId", nativeQuery = true)
    void deleteLocationFavoriteByNormalMemberAndLocationInfo(@Param(value = "memberId")Integer memberId, @Param(value="locationId")Integer locationId);

}
