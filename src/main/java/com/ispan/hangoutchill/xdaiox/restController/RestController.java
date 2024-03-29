package com.ispan.hangoutchill.xdaiox.restController;

import java.util.List;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.hangoutchill.member.model.NormalMember;
import com.ispan.hangoutchill.member.service.NormalMemberService;
import com.ispan.hangoutchill.xdaiox.dao.DiscussionsRepository;
import com.ispan.hangoutchill.xdaiox.dao.ImagesRepository;
import com.ispan.hangoutchill.xdaiox.dao.MessagesRepository;
import com.ispan.hangoutchill.xdaiox.model.Discussions;
import com.ispan.hangoutchill.xdaiox.model.DiscussionsDTO;
import com.ispan.hangoutchill.xdaiox.model.Favourite;
import com.ispan.hangoutchill.xdaiox.model.FavouriteDTO;
import com.ispan.hangoutchill.xdaiox.model.Images;
import com.ispan.hangoutchill.xdaiox.service.DiscussionsService;
import com.ispan.hangoutchill.xdaiox.service.FavouriteService;


@Controller
public class RestController {
	
	@Autowired
	private FavouriteService fService;
	
	@Autowired
	private DiscussionsService dService;
	
    @Autowired
    NormalMemberService nMemberService;
	
    @Autowired
    private ImagesRepository imageRepository;
    
//    @PostMapping("/discussion/addFavourite")
//    public String toAddFavouriteDiscussion(@ModelAttribute("favourite") Favourite fvt,Model model) {
//    	fService.addFavourite(fvt);
//    	model.addAttribute("favourite", fvt);
//    	return "redirect:/discussion/allDiscussion";
//    }
    
    //***********ajax新增最愛***********
    @ResponseBody
	@PostMapping("api/addFavourite/post")
	public /*List<FavouriteDTO>*/ void postMessageApi(@RequestBody Favourite fvt,
			@CurrentSecurityContext(expression = "authentication")Authentication authentication){
		
        String name = authentication.getName();
        NormalMember result = nMemberService.findNormalUserByAccount(name);
    	
		fService.addFavourite(fvt,result);
		
//		System.out.println("========================at Controller=========================="+"fvt.getDiscussions().getD_id() :"+fvt.getDiscussions().getD_id()+"  fvt.getNormalMember().getAccount(): "+fvt.getNormalMember().getAccount()+"==================================================");

//		Integer memberId = fvt.getNormalMember().getId();
//		List<FavouriteDTO> fav = fService.findAllFavouriteById(memberId);
		
//		System.out.println("=================================================================="+fav.size()+"=============================================================");
//	    return fav;
	}
    
//    //***********測試用***********
//	@GetMapping("/discussion/ajax")
//	public String ajaxPage() {
//		return "discussion/ajax";
//	}
	
    //***********ajax返回img***********
    @ResponseBody
    @GetMapping("/discussion/upload/image/{id}")
    public ResponseEntity<byte[]> downloadImage(@PathVariable Integer id){
    	Images image = imageRepository.findById(id).orElse(null);
    	if (image == null) {
			return ResponseEntity.notFound().build();
		}
    	byte[] imageData = image.getImg_data();
    	return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageData);
    }
    
    @ResponseBody
    @GetMapping("/discussion/blurContents")
    public List<DiscussionsDTO> findBlurContents (@RequestParam(name="blurSearchContent")String contents){
        System.out.println("******************findBlurContents有進來喔"+contents+"******************");
        
        List<DiscussionsDTO> discussionsList = dService.findBlurContents(contents);

        for (DiscussionsDTO discussionDTO : discussionsList) {
            String contentss = discussionDTO.getContents();
            
            System.out.println("====================================Contents: " + contentss);
            
            if (discussionDTO != null) {
                System.out.println("===============================Normal Member ID: " + discussionDTO.getM_id());
                System.out.println("===============================Normal Member Name: " + discussionDTO.getNickName());
                // 可以根据需要打印 Normal Member 的其他属性
            } else {
                System.out.println("============================Normal Member is null");
            }
            
            System.out.println("----------------------");
        }
        return discussionsList;
    }
    
}
