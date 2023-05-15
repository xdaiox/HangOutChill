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
public class DiscussionsService {
	
	@Autowired
	private DiscussionsRepository dssRepository;
	
	@Autowired
	private MessagesRepository mssRepository;
	
	public void addDiscussions(Discussions dss) {
		dss.setVisibleTrue();
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
	
	//找所有討論 where
	public Page<Discussions> findAllByPage(Integer pageNumber){
		Pageable pgb =PageRequest.of(pageNumber-1, 20, Sort.Direction.DESC, "postDate");
		Page<Discussions> page = dssRepository.findAll(pgb);
		return page;
	}
	
	//找所有討論 where visible=true
	public Page<Discussions> findByPageWhereVisible(Integer pageNumber,Integer showCount){
		Pageable pgb =PageRequest.of(pageNumber-1, showCount, Sort.Direction.DESC, "postDate");
		Page<Discussions> page = dssRepository.findByVisibleTrue(pgb);
		return page;
	}
	
	//算所有討論的回覆數量
	public Page<Messages> CountMessageByDiscussion(Integer pageNumber){
		Pageable pgb =PageRequest.of(pageNumber-1, 10, Sort.Direction.DESC, "postDate");
		Page<Messages> page = mssRepository.findAll(pgb);
		return page;
	}
	
	
	//更新討論
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
	
	//管理者隱藏討論
	@Transactional
	public Discussions visibleDiscussion(Integer id) {
		Optional<Discussions> option = dssRepository.findById(id);
		Discussions discussion = option.get();
		System.out.println("=============================="+id+"==============================");
		if (discussion.isVisible()) {
			discussion.setVisible(false);
		}else {
			discussion.setVisible(true);
		}
		dssRepository.save(discussion);
		return discussion;
	}
	
//    @Override
//    @Transactional
//    public NormalMember updateEnable(Integer id){
//        Optional<NormalMember> byId = nMemberRepository.findById(id);
//        NormalMember normalMember = byId.get();
//        System.out.println(id);
//        if (normalMember.isEnabled()){
//            normalMember.setEnabled(false);
//        }else {
//            normalMember.setEnabled(true);
//        }
//
//        nMemberRepository.save(normalMember);
//        return  normalMember;
//    }
	
	
//	public Discussions getLatest() {
//		return dssRepository.findDIdByPostDateDesc();
//	}

}
