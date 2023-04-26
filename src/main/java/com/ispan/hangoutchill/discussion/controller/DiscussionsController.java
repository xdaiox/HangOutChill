package com.ispan.hangoutchill.discussion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan.hangoutchill.discussion.model.Discussions;
import com.ispan.hangoutchill.discussion.service.DiscussionsService;

@Controller
public class DiscussionsController {
	
	@Autowired
	private DiscussionsService dService;
	
	@GetMapping("/discussion/allDiscussion")
	public String toShowAllDiscussion(@RequestParam(name="p",defaultValue = "1")Integer pageNumber,Model model) {
//		上面的p是在allDiscussion.jsp的href="${contextRoot}/discussion/allDiscussion?p=${pageNumber}">${pageNumber}</a></li>
		Page<Discussions> page = dService.findByPage(pageNumber);
		model.addAttribute("page", page);
		
		return"discussion/allDiscussion";
	}
	
	
    @GetMapping("/discussion/newDiscussion")
    public  String toNewDiscussion (Model model){
    	model.addAttribute("discussion", new Discussions());
    	
    	return"discussion/newDiscussion";
    }
    @PostMapping("/discussion/post")
    public String postDiscussion(@ModelAttribute("discussion") Discussions dss,Model model) {
    	dService.addDiscussions(dss);
    	model.addAttribute("discussion", new Discussions());
    	return"redirect:/discussion/allDiscussion";
    }
    
    @GetMapping("/discussion/editDiscussion")
    public String editDiscussion(@RequestParam("id") Integer id,Model model){
    	Discussions dss = dService.findDiscussionById(id);
    	model.addAttribute("discussion", dss);
    	return "discussion/editDiscussionPage";
    }
    
    
    @PutMapping("/discussion/replyDiscussion")
    public String putEditedDiscussion(@ModelAttribute("discussion") Discussions dss) {
    	dService.updateById(dss.getD_id(),dss.getTitle());
    	return "redirect:/discussion/allDiscussion";
    }
    
    
    
    @GetMapping("/discussion/replyDiscussion")
    public  String toreplyDiscussion (){
      return"discussion/replyDiscussion";
    }
    
}
