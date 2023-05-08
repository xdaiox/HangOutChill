package com.ispan.hangoutchill.xdaiox.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.hangoutchill.xdaiox.model.Discussions;

public interface DiscussionsRepository extends JpaRepository<Discussions, Integer> {
//	public Discussions findDIdByPostDateDesc();
	
	public Page<Discussions> findByVisibleTrue(Pageable pageable);

	
}
