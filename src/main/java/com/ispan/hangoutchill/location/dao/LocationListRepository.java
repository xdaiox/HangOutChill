package com.ispan.hangoutchill.location.dao;

import com.ispan.hangoutchill.location.model.Location;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LocationListRepository extends JpaRepository<Location,Integer>  {


}
