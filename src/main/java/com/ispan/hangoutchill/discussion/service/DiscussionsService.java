package com.ispan.hangoutchill.discussion.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.hangoutchill.discussion.dao.DiscussionsRepository;
import com.ispan.hangoutchill.discussion.model.Discussions;


@Service
public class DiscussionsService {

	@Autowired
	private DiscussionsRepository dssRepository;
	
	public void addDiscussions(Discussions dss) {
		dssRepository.save(dss);
	}
	
	public Discussions findDiscussionById(Integer id) {
		Optional<Discussions> option = dssRepository.findById(id);
		
		if(option.isEmpty()) {
			return null;
		}
		return option.get();
	}
	
	public void deleteDiscussion(Integer id) {
		dssRepository.deleteById(id);
	}
	
	public Page<Discussions> findByPage(Integer pageNumber){
		Pageable pgb =PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "postDate");
		Page<Discussions> page = dssRepository.findAll(pgb);
		return page;
	}
	
	@Transactional
	public Discussions updateById(Integer id,String newDiscussions) {
		Optional<Discussions> option = dssRepository.findById(id);
		
		if(option.isPresent()) {
			Discussions dss = option.get();
			dss.setContents(newDiscussions);
			return dss;
		}
		return null;
	}
	
	public Discussions getLatest() {
		return dssRepository.findFirstByOrderByPostDateDesc();
	}
}
