package com.ispan.hangoutchill.location.dao;

import com.ispan.hangoutchill.location.model.LocationStoreInfo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LocationListRepository extends JpaRepository<LocationStoreInfo,Integer>  {


}
