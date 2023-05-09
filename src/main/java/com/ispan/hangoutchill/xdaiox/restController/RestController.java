package com.ispan.hangoutchill.xdaiox.restController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.hangoutchill.xdaiox.model.Favourite;
import com.ispan.hangoutchill.xdaiox.model.FavouriteDTO;
import com.ispan.hangoutchill.xdaiox.service.FavouriteService;


@Controller
public class RestController {
	
	@Autowired
	private FavouriteService fService;
	
    
    
//    @PostMapping("/discussion/addFavourite")
//    public String toAddFavouriteDiscussion(@ModelAttribute("favourite") Favourite fvt,Model model) {
//    	fService.addFavourite(fvt);
//    	model.addAttribute("favourite", fvt);
//    	return "redirect:/discussion/allDiscussion";
//    }
    
    
    @ResponseBody
	@PostMapping("api/addFavourite/post")
	public List<FavouriteDTO> postMessageApi(@RequestBody Favourite fvt){
		
		fService.addFavourite(fvt);
		
//		System.out.println("========================at Controller=========================="+"fvt.getDiscussions().getD_id() :"+fvt.getDiscussions().getD_id()+"  fvt.getNormalMember().getAccount(): "+fvt.getNormalMember().getAccount()+"==================================================");

//		int id = fvt.getNormalMember().getId();
//		Set<Favourite> fav = fService.findAllFavouriteById(56);
		Integer memberId = fvt.getNormalMember().getId();
		List<FavouriteDTO> fav = fService.findAllFavouriteById(memberId);
		
		System.out.println("=================================================================="+fav.size()+"=============================================================");
	    return fav;
		
	}
    
	@GetMapping("/messages/ajax")
	public String ajaxPage() {
		return "message/ajaxMessage";
	}
}
