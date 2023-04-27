package com.ispan.hangoutchill.location.dao;

import com.ispan.hangoutchill.location.model.LocationInfo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LocationInfoRepository extends JpaRepository<LocationInfo,Integer>  {


}
