package com.ispan.hangoutchill.xdaiox.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.hangoutchill.xdaiox.dao.DiscussionsRepository;
import com.ispan.hangoutchill.xdaiox.model.Discussions;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Service
public class DiscussionsService {

    @PersistenceContext
    private EntityManager entityManager;
	
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
	
	public void deleteDiscussionById(Integer id) {
		dssRepository.deleteById(id);
	}
	
	public Page<Discussions> findByPage(Integer pageNumber){
		Pageable pgb =PageRequest.of(pageNumber-1, 5, Sort.Direction.DESC, "postDate");
		Page<Discussions> page = dssRepository.findAll(pgb);
		return page;
	}
	
	@Transactional
	public Discussions updateById(Integer id,String title,String type,String newDiscussions) {
		Optional<Discussions> option = dssRepository.findById(id);
		
		if(option.isPresent()) {
			Discussions dss = option.get();
			dss.setTitle(title);
			dss.setType(type);
			dss.setContents(newDiscussions);
			return dss;
		}
		return null;
	}
	

	@Transactional
	public void hiddenDiscussion(Integer id) {
		dssRepository.deleteById(id);
	}
	
//	public Discussions getLatest() {
//		return dssRepository.findDIdByPostDateDesc();
//	}

}
