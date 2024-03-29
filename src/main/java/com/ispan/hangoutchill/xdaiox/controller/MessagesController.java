package com.ispan.hangoutchill.xdaiox.controller;

import javax.mail.Message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;
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
	
    @Autowired
    NormalMemberService nMemberService;
	
    
    //顯示單一討論
	@GetMapping("/message/allMessages/{id}")
	public String toShowAllMessages(@RequestParam(name="p",defaultValue = "1")Integer pageNumber,@PathVariable(name="id") Integer d_id,Model model,
									@CurrentSecurityContext(expression = "authentication")Authentication authentication) {
									
    	String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result", result);
		
		Page<Messages> page = mService.findMessageByPage(pageNumber,d_id);
		Discussions dss = dService.findDiscussionById(d_id);
		model.addAttribute("discussion", dss);
		model.addAttribute("page", page);
		model.addAttribute("replyDiscussion",new Messages());
		return"/discussion/showSingleDiscussion";
	}
	
    @PostMapping("/message/post/{id}")
    public String postMessage(@ModelAttribute("replyDiscussion") Messages mss, Model model,
    							@PathVariable(name="id")Integer d_id,
    							@CurrentSecurityContext(expression = "authentication")Authentication authentication) {
    	
    	String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result", result);
    	
    	mService.addMessage(mss);
    	model.addAttribute("message", new Messages());
    	
    	return"redirect:/message/allMessages/{id}";
    }
    
    
    //==============刪除回覆==============
    @DeleteMapping("/message/deleteMessage/{id}/{m_id}")
    public String toDeleteButItsNotActuallyDeleteItsHiddenMessage(@PathVariable("id") Integer id,@PathVariable("m_id")Integer m_id,Model model,
			@CurrentSecurityContext(expression = "authentication")Authentication authentication) {

    	String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result", result);
    	
    	
    	System.out.println("============================before delete============================="+m_id+"============================before delete=============================");

    	mService.deleteMessageById(m_id);
    	
    	System.out.println("============================after delete============================="+m_id+"============================after delete=============================");
    	return "redirect:/message/allMessages/{id}";
    }
    
    
    //==============編輯回覆==============
    
    @PostMapping("/message/editMessage/{id}/{m_id}")
    public String editMessage(@PathVariable("id") Integer id,@PathVariable("m_id") Integer m_id, Model model,
    		@CurrentSecurityContext(expression = "authentication")Authentication authentication) {

    	String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result", result);
    	
        Discussions dss = dService.findDiscussionById(id);
        model.addAttribute("discussion", dss);
        
        Messages mss = mService.findMessageById(m_id);
        model.addAttribute("message", mss);
        
        return "discussion/editMessagePage";
    }
    								
    @PutMapping("/message/editMessage/{id}")
    public String toEditeMessage(@ModelAttribute("message") Messages mss,@PathVariable("id") Integer id,Model model,
    		@CurrentSecurityContext(expression = "authentication")Authentication authentication) {

    	String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result", result);
    	
    	mService.updateMessageById(mss.getDm_id(),mss.getContents());
    	return "redirect:/message/allMessages/{id}";
    }
    

}
