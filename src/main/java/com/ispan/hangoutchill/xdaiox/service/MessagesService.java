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
import com.ispan.hangoutchill.xdaiox.dao.MessagesRepository;
import com.ispan.hangoutchill.xdaiox.model.Discussions;
import com.ispan.hangoutchill.xdaiox.model.Messages;


@Service
public class MessagesService {

	@Autowired
	private MessagesRepository mssRepository;
	
	@Autowired
	private DiscussionsRepository dssRepository;
	
	public void addMessage(Messages mss) {
		mssRepository.save(mss);
	}
	
	public void addMessageByDid() {
		
	}
	
	public Messages findMessageById(Integer id) {
		Optional<Messages> option = mssRepository.findById(id);
		
		if(option.isEmpty()) {
			return null;
		}
		return option.get();
	}
	
	public void deleteMessageById(Integer id) {
		mssRepository.deleteById(id);
	}
	
	public Page<Messages> findMessageByPage(Integer pageNumber,Integer d_id){
		Pageable pgb =PageRequest.of(pageNumber-1, 5, Sort.Direction.ASC, "postDate");
		Discussions id = dssRepository.findById(d_id).orElse(null);
		Page<Messages> page = mssRepository.findContentsByDiscussions(id,pgb);
		return page;
	}
	
	@Transactional
	public Messages updateMessageById(Integer id,String newMessages) {
		Optional<Messages> option = mssRepository.findById(id);
		
		if(option.isPresent()) {
			Messages dss = option.get();
			dss.setContents(newMessages);
			return dss;
		}
		return null;
	}
	

	@Transactional
	public void hiddenMessage(Integer id) {
		mssRepository.deleteById(id);
	}
	
//	public Discussions getLatest() {
//		return dssRepository.findFirstByOrderByPostDateDesc();
//	}

}
