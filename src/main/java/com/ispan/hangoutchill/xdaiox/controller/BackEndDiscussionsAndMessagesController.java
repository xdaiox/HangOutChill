package com.ispan.hangoutchill.xdaiox.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
public class BackEndDiscussionsAndMessagesController {
	
	@Autowired
	private DiscussionsService dService;
	
	@Autowired
	private MessagesService mService;
	
    @Autowired
    NormalMemberService nMemberService;
	

    //==============後台顯示全部討論==============  
	@GetMapping("/back/allDiscussions")
	public String toBackShowAllDiscussion(@RequestParam(name="p",defaultValue = "1")Integer pageNumber,Model model,
										@CurrentSecurityContext(expression = "authentication")Authentication authentication) {
		String name = authentication.getName();
		NormalMember result = nMemberService.findNormalUserByAccount(name);
		model.addAttribute("result", result);
		
		Page<Discussions> page = dService.findAllByPage(pageNumber);
		model.addAttribute("page", page);
		return"/discussion/backEndAllDiscussion";
	}
	
	//==============後台查看單一討論及回覆==============
	@GetMapping("/back/backCheckDiscussion/{id}")
	public String toEditBackDiscussionAndMessage(@RequestParam(name="p",defaultValue = "1")Integer pageNumber,@PathVariable("id") Integer d_id,Model model,
									@CurrentSecurityContext(expression = "authentication")Authentication authentication) {
									
    	String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result", result);
		
		Page<Messages> page = mService.findMessageByPage(pageNumber,d_id);
		Discussions dss = dService.findDiscussionById(d_id);
		model.addAttribute("discussion", dss);
		model.addAttribute("page", page);
		model.addAttribute("replyDiscussion",new Messages());
		return"/discussion/backEndShowDiscussionAndMessage";
	}
    
	//==============後台編輯討論==============
    @GetMapping("/back/backEndEditDiscussion/{id}")
    public String editDiscussion(@PathVariable("id") Integer id, Model model) {
        Discussions dss = dService.findDiscussionById(id);
        model.addAttribute("discussion", dss);
        return "discussion/backEndEditDiscussionPage";
    }
    
	//==============後台put編輯討論==============
    @PutMapping("/back/backEndEditDiscussion/{id}")
    public String toEditedDiscussion(@ModelAttribute("discussion") Discussions dss,@PathVariable("id") Integer id) {
    	dService.updateById(dss.getD_id(),dss.getTitle(),dss.getType(),dss.getContents());
    	return "redirect:/back/backCheckDiscussion/{id}";
    }
    
	//==============後台刪除單一討論及回覆==============
    @Transactional
    @DeleteMapping("/back/deleteDiscussion/{id}")
    public String toDeleteButItsNotActuallyDeleteItsHiddenDiscussion(@PathVariable("id") Integer id) {
    	dService.deleteDiscussionById(id);
    	System.out.println("========================after delete========================"+id+"========================after delete========================");
    	return "redirect:/back/allDiscussions";
    }

    //==============後台post新增回覆==============
    @PostMapping("/back/post/{id}")
    public String postMessage(@ModelAttribute("replyDiscussion") Messages mss, Model model,@PathVariable(name="id")Integer d_id) {
    	
    	mService.addMessage(mss);
    	model.addAttribute("message", new Messages());
    	
    	return"redirect:/back/backCheckDiscussion/{id}";
    }
    
    
	//==============後台刪除回覆==============
    @DeleteMapping("/back/deleteMessage/{id}/{m_id}")
    public String toDeleteButItsActuallyHiddenMessage(@PathVariable("id") Integer id,@PathVariable("m_id")Integer m_id) {
    	mService.deleteMessageById(m_id);
      	return "redirect:/back/backCheckDiscussion/{id}";
    }
    
    
	//==============後台編輯回覆==============
    @GetMapping("/back/editMessage/{id}")
    public String editMessage(@PathVariable("id") Integer id, Model model) {
        Discussions dss = dService.findDiscussionById(id);
        model.addAttribute("discussion", dss);
        return "discussion/editDiscussionPage";
    }
    
    @PutMapping("/back/editMessage/{id}")
    public String toEditMessage(@ModelAttribute("discussion") Discussions dss,@PathVariable("id") Integer id) {
    	dService.updateById(dss.getD_id(),dss.getTitle(),dss.getType(),dss.getContents());
    	return "redirect:/message/allMessages/{id}";
    }
    
    @PutMapping("/back/visiable")
    public String toHiddenDiscussion(@ModelAttribute("id") Integer id) {
    	dService.visibleDiscussion(id);
    	return "redirect:/back/allDiscussions";
    }
    
    
//    
//    
//    
//    @GetMapping("/discussion/replyDiscussion")
//    public  String toreplyDiscussion (){
//      return"discussion/replyDiscussion";
//    }
    
    
}
