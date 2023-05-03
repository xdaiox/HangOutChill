package com.ispan.hangoutchill.xdaiox.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.hangoutchill.xdaiox.model.Messages;

public interface MessagesRepository extends JpaRepository<Messages, Integer> {
//	public Discussions findFirstByOrderByPostDateDesc();

	
}
