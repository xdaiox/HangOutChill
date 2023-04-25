package com.ispan.hangoutchill.discussion.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.hangoutchill.discussion.model.Discussions;

public interface DiscussionsRepository extends JpaRepository<Discussions, Integer> {
	public Discussions findFirstByOrderByPostDateDesc();

}
