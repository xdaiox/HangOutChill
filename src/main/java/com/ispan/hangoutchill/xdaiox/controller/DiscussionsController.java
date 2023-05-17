package com.ispan.hangoutchill.xdaiox.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
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
import com.ispan.hangoutchill.xdaiox.dao.MessagesRepository;
import com.ispan.hangoutchill.xdaiox.model.Discussions;
import com.ispan.hangoutchill.xdaiox.model.Favourite;
import com.ispan.hangoutchill.xdaiox.model.FavouriteDTO;
import com.ispan.hangoutchill.xdaiox.model.Messages;
import com.ispan.hangoutchill.xdaiox.service.DiscussionsService;
import com.ispan.hangoutchill.xdaiox.service.FavouriteService;
import com.ispan.hangoutchill.xdaiox.service.MessagesService;
@Controller
public class DiscussionsController {
	
	@Autowired
	private DiscussionsService dService;

	@Autowired
	private MessagesService mService;
	
	@Autowired
	private FavouriteService fService;
	
    @Autowired
    NormalMemberService nMemberService;
    
    @Autowired
	private MessagesRepository mssRepository;
	
	@GetMapping("/discussion/allDiscussion/{showCount}")
	public String toShowAllDiscussion(@RequestParam(name="p",defaultValue = "1")Integer pageNumber,Model model,
										@CurrentSecurityContext(expression = "authentication")Authentication authentication,
										@PathVariable("showCount") Integer showCount) {
//		上面的p是在allDiscussion.jsp的href="${contextRoot}/discussion/allDiscussion?p=${pageNumber}">${pageNumber}</a></li>
		Page<Discussions> page = dService.findByPageWhereVisible(pageNumber,showCount);
		model.addAttribute("page", page);
		
        String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result", result);
        
		model.addAttribute("showCount",showCount);
        Page<Messages> pageCount = dService.CountMessageByDiscussion(pageNumber);
        
        Map<Integer, Long> replyCountMap = new HashMap<>();
        for (Messages message : pageCount) {
            Discussions discussion = message.getDiscussions();
            Long count = mssRepository.countByDiscussions(discussion);
            replyCountMap.put(discussion.getD_id(), count);
            System.out.println("====================discussion.getD_id()= "+discussion.getD_id()+"====================");
        }
        
        model.addAttribute("replyCountMap", replyCountMap);
        
        return "discussion/allDiscussion";
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
    public String postDiscussion(@ModelAttribute("discussion") Discussions dss,Model model,
			@CurrentSecurityContext(expression = "authentication")Authentication authentication) {
    	
    	String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result", result);
        
        result.getId();
        
//    	System.out.println("==================================================="+result.getId()+"===================================================");
    	dService.addDiscussions(dss);
    	
//    	Discussions discussion = dService.getLatest();
    	
//    	Images image = new Images();
//    	image.setFkImgDiscussions(discussion);
    	
    	model.addAttribute("discussion", new Discussions());
    	return"redirect:/discussion/allDiscussion/10";
    }
    
//    @GetMapping("/discussion/editDiscussion")
//    public String editDiscussion(@RequestParam("id") Integer id,Model model){
//    	Discussions dss = dService.findDiscussionById(id);
//    	model.addAttribute("discussion", dss);
//    	return "discussion/editDiscussionPage";
//    }
//    
    @GetMapping("/discussion/editDiscussion/{id}")
    public String editDiscussion(@PathVariable("id") Integer id, Model model,
    		@CurrentSecurityContext(expression = "authentication")Authentication authentication) {
    	
    	String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result", result);
    	
        Discussions dss = dService.findDiscussionById(id);
        model.addAttribute("discussion", dss);
        return "discussion/editDiscussionPage";
    }
    
    @PutMapping("/discussion/editDiscussion/{id}")
    public String toEditedDiscussion(@ModelAttribute("discussion") Discussions dss,@PathVariable("id") Integer id,Model model,
    		@CurrentSecurityContext(expression = "authentication")Authentication authentication) {

    	String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result", result);
    	
    	dService.updateById(dss.getD_id(),dss.getTitle(),dss.getType(),dss.getContents());
    	return "redirect:/message/allMessages/{id}";
    }
    
    
    //==============刪除討論==============
    @Transactional
    @DeleteMapping("/discussion/deleteDiscussion/{id}")
    public String toDeleteButItsNotActuallyDeleteItsHiddenDiscussion(@PathVariable("id") Integer id,Model model,
    		@CurrentSecurityContext(expression = "authentication")Authentication authentication) {

    	String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
        model.addAttribute("result", result);
    	
    	dService.deleteDiscussionById(id);
    	return "redirect:/discussion/allDiscussion/10";
    }
    
    //==============找使用者所有的討論收藏==============
    @GetMapping("/discussion/allFavourite")
    public String toShowAllFavourite(@CurrentSecurityContext(expression = "authentication")
										Authentication authentication,Model model) {
    	String name = authentication.getName();
    	NormalMember result = nMemberService.findNormalUserByAccount(name);
    	model.addAttribute("result", result);
//    	System.out.println("============/discussion/allFavourite=================name: "+name+"===============================");
//    	System.out.println("============/discussion/allFavourite=================result: "+result+"===============================");

        if(result != null) {
        	List<Favourite> fav = fService.findAllFavouriteById(result.getId());
        	// Print each object in the list
//        	for(FavouriteDTO fav : favDTO) {
//        		System.out.println(fav.toString());
//        	}
        	model.addAttribute("favouriteDTO",fav);
        }	
        
            
            
//            if (favDTO.isEmpty()) {
//                System.out.println("FavouriteDTO list is empty");
//            } else {
//                System.out.println("FavouriteDTO list is not empty");
//            }
            
            System.out.println("==============================result NOT NULL=============================="+"==============================result NOT NULL==============================");



        return "discussion/allFavourite";
    }
    
    
    
//    @GetMapping("/discussion/replyDiscussion")
//    public  String toreplyDiscussion (){
//      return"discussion/replyDiscussion";
//    }
    
    
}
