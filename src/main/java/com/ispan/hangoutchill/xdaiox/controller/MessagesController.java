package com.ispan.hangoutchill.xdaiox.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan.hangoutchill.xdaiox.model.Discussions;
import com.ispan.hangoutchill.xdaiox.model.Messages;
import com.ispan.hangoutchill.xdaiox.service.DiscussionsService;
import com.ispan.hangoutchill.xdaiox.service.MessagesService;

@Controller
public class MessagesController {
	
	@Autowired
	private MessagesService mService;
	
	@Autowired
	private DiscussionsService dService;
	
	@GetMapping("/message/allMessages/{id}")
	public String toShowAllMessages(@RequestParam(name="p",defaultValue = "1")Integer pageNumber,@PathVariable(name="id") Integer d_id,Model model) {
		Page<Messages> page = mService.findMessageByPage(pageNumber,d_id);
		Discussions dss = dService.findDiscussionById(d_id);
		model.addAttribute("discussion", dss);
		model.addAttribute("page", page);
		model.addAttribute("replyDiscussion",new Messages());
		return"/discussion/showSingleDiscussion";
	}
	
    @PostMapping("/message/post/{id}")
    public String postMessage(@ModelAttribute("replyDiscussion") Messages mss, Model model,@PathVariable(name="id")Integer d_id) {
    	
    	mService.addMessage(mss);
    	model.addAttribute("message", new Messages());
    	
    	return"redirect:/message/allMessages/{id}";
    }
    

    
    @DeleteMapping("/message/deleteMessage/{id}/{m_id}")
    public String toDeleteButItsNotActuallyDeleteItsHiddenMessage(@PathVariable("id") Integer id,@PathVariable("m_id")Integer m_id) {
    	mService.deleteMessageById(m_id);
    	return "redirect:/message/allMessages/{id}";
    }

}
