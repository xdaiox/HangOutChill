package com.ispan.hangoutchill.xdaiox.restController;

import java.util.List;
import java.util.Set;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;
import com.ispan.hangoutchill.xdaiox.model.Discussions;
import com.ispan.hangoutchill.xdaiox.model.Favourite;
import com.ispan.hangoutchill.xdaiox.model.Messages;
import com.ispan.hangoutchill.xdaiox.service.DiscussionsService;
import com.ispan.hangoutchill.xdaiox.service.FavouriteService;
import com.ispan.hangoutchill.xdaiox.service.MessagesService;


@Controller
public class RestController {
	
	@Autowired
	private DiscussionsService dService;
	
	@Autowired
	private FavouriteService fService;
	
	@Autowired
	private MessagesService mService;
	
    @Autowired
    NormalMemberService nMemberService;
	
    
    
//    @PostMapping("/discussion/addFavourite")
//    public String toAddFavouriteDiscussion(@ModelAttribute("favourite") Favourite fvt,Model model) {
//    	fService.addFavourite(fvt);
//    	model.addAttribute("favourite", fvt);
//    	return "redirect:/discussion/allDiscussion";
//    }
    
	@ResponseBody
	@PostMapping("api/addFavourite/post")
	public List<Favourite> postMessageApi(@RequestBody Favourite fvt){
		
		fService.addFavourite(fvt);
		
//		System.out.println("========================at Controller=========================="+"fvt.getDiscussions().getD_id() :"+fvt.getDiscussions().getD_id()+"  fvt.getNormalMember().getAccount(): "+fvt.getNormalMember().getAccount()+"==================================================");

//		int id = fvt.getNormalMember().getId();
//		Set<Favourite> fav = fService.findAllFavouriteById(56);
		Integer memberId = fvt.getNormalMember().getId();
		List<Favourite> fav = fService.findAllFavouriteById(memberId);
	    return fav;
		
	}
    
	@GetMapping("/messages/ajax")
	public String ajaxPage() {
		return "message/ajaxMessage";
	}
}
