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
import com.ispan.hangoutchill.xdaiox.model.Images;
import com.ispan.hangoutchill.xdaiox.service.DiscussionsService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
@Controller
public class DiscussionsController {
	
	@Autowired
	private DiscussionsService dService;
	
    @Autowired
    NormalMemberService nMemberService;
	
	@GetMapping("/discussion/allDiscussion")
	public String toShowAllDiscussion(@RequestParam(name="p",defaultValue = "1")Integer pageNumber,Model model) {
//		上面的p是在allDiscussion.jsp的href="${contextRoot}/discussion/allDiscussion?p=${pageNumber}">${pageNumber}</a></li>
		Page<Discussions> page = dService.findByPage(pageNumber);
		model.addAttribute("page", page);
		
		return"discussion/allDiscussion";
	}
	
	
    @GetMapping("/discussion/newDiscussion")
    public  String toNewDiscussion (@CurrentSecurityContext(expression = "authentication")
    								Authentication authentication,Model model){
    	String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result", result);
    	model.addAttribute("discussion", new Discussions());
    	
    	return"discussion/newDiscussion";
    }
    @PostMapping("/discussion/post")
    public String postDiscussion(@ModelAttribute("discussion") Discussions dss,Model model) {
    	System.out.println("==================================================="+dss.getD_id()+dss.getD_id()+dss.getD_id()+dss.getD_id()+"===================================================");
    	dService.addDiscussions(dss);
    	
//    	Discussions discussion = dService.getLatest();
    	
//    	Images image = new Images();
//    	image.setFkImgDiscussions(discussion);
    	
    	model.addAttribute("discussion", new Discussions());
    	return"redirect:/discussion/allDiscussion";
    }
    
//    @GetMapping("/discussion/editDiscussion")
//    public String editDiscussion(@RequestParam("id") Integer id,Model model){
//    	Discussions dss = dService.findDiscussionById(id);
//    	model.addAttribute("discussion", dss);
//    	return "discussion/editDiscussionPage";
//    }
//    
    @GetMapping("/discussion/editDiscussion/{id}")
    public String editDiscussion(@PathVariable("id") Integer id, Model model) {
        Discussions dss = dService.findDiscussionById(id);
        model.addAttribute("discussion", dss);
        return "discussion/editDiscussionPage";
    }
    
    @PutMapping("/discussion/editDiscussion/{id}")
    public String toEditedDiscussion(@ModelAttribute("discussion") Discussions dss,@PathVariable("id") Integer id) {
    	dService.updateById(dss.getD_id(),dss.getTitle(),dss.getType(),dss.getContents());
    	return "redirect:/message/allMessages/{id}";
    }
    
    @Transactional
    @DeleteMapping("/discussion/deleteDiscussion/{id}")
    public String toDeleteButItsNotActuallyDeleteItsHiddenDiscussion(@PathVariable("id") Integer id) {
    	dService.deleteDiscussionById(id);
    	System.out.println("========================after delete========================"+id+"========================after delete========================");
    	return "redirect:/discussion/allDiscussion";
    }

//    
//    
//    
//    @GetMapping("/discussion/replyDiscussion")
//    public  String toreplyDiscussion (){
//      return"discussion/replyDiscussion";
//    }
    
    
}
