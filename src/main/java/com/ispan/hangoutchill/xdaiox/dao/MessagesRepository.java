package com.ispan.hangoutchill.xdaiox.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.hangoutchill.xdaiox.model.Discussions;
import com.ispan.hangoutchill.xdaiox.model.Messages;

public interface MessagesRepository extends JpaRepository<Messages, Integer> {
//	public Discussions findFirstByOrderByPostDateDesc();

	public Page<Messages> findContentsByDiscussions(Discussions discussions, Pageable pageable);
	public Page<Messages> findAll(Pageable pageable);
	
	public long countByDiscussions(Discussions discussions);
}
