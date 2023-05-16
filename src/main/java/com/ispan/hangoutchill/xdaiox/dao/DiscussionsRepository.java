package com.ispan.hangoutchill.xdaiox.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.hangoutchill.xdaiox.model.Discussions;

public interface DiscussionsRepository extends JpaRepository<Discussions, Integer> {
//	public Discussions findDIdByPostDateDesc();
    
	public Page<Discussions> findByVisibleTrue(Pageable pageable);

    @Query(value = "from Discussions where contents like '%'+:contents+'%'")
    public List<Discussions> findBlurContents(@Param(value = "contents")String contents);
}
