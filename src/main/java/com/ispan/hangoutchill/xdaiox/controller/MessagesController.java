package com.ispan.hangoutchill.xdaiox.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan.hangoutchill.xdaiox.model.Messages;
import com.ispan.hangoutchill.xdaiox.service.MessagesService;

@Controller
public class MessagesController {
	
	@Autowired
	private MessagesService mService;
	
	@GetMapping("/message/allMessages")
	public String toShowAllMessages(@RequestParam(name="p",defaultValue = "1")Integer pageNumber,Model model) {
		Page<Messages> page = mService.findMessageByPage(pageNumber);
		model.addAttribute("page", page);
		
		return"/message/allMessages";
	}
	
	
    @GetMapping("/message/newMessage")
    public  String toNewMessage (Model model){
    	model.addAttribute("message", new Messages());
    	
    	return"/message/newMessage";
    }
    @PostMapping("/message/post")
    public String postMessage(@ModelAttribute("message") Messages mss,Model model) {
    	mService.addMessage(mss);
    	model.addAttribute("message", new Messages());
    	return"redirect:/discussion/allDiscussion";
    }

}
