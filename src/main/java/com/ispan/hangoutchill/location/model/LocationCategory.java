package com.ispan.hangoutchill.location.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.data.annotation.Id;

@Entity
@Table(name="locationCategory")
public class LocationCategory {

	@Id
    @Column(name = "location_category_Id")
    private Integer locCatID;
	
    @Column(name = "location_category_name")
    private Integer locMbrName;

	public Integer getLocCatID() {
		return locCatID;
	}

	public void setLocCatID(Integer locCatID) {
		this.locCatID = locCatID;
	}

	public Integer getLocMbrName() {
		return locMbrName;
	}

	public void setLocMbrName(Integer locMbrName) {
		this.locMbrName = locMbrName;
	}

}
