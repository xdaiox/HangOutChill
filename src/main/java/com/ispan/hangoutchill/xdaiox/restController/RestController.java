package com.ispan.hangoutchill.xdaiox.restController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.hangoutchill.xdaiox.dao.ImagesRepository;
import com.ispan.hangoutchill.xdaiox.model.Favourite;
import com.ispan.hangoutchill.xdaiox.model.FavouriteDTO;
import com.ispan.hangoutchill.xdaiox.model.Images;
import com.ispan.hangoutchill.xdaiox.service.FavouriteService;


@Controller
public class RestController {
	
	@Autowired
	private FavouriteService fService;
	
    @Autowired
    private ImagesRepository imageRepository;
    
//    @PostMapping("/discussion/addFavourite")
//    public String toAddFavouriteDiscussion(@ModelAttribute("favourite") Favourite fvt,Model model) {
//    	fService.addFavourite(fvt);
//    	model.addAttribute("favourite", fvt);
//    	return "redirect:/discussion/allDiscussion";
//    }
    
    
    @ResponseBody
	@PostMapping("api/addFavourite/post")
	public /*List<FavouriteDTO>*/ void postMessageApi(@RequestBody Favourite fvt){
		
		fService.addFavourite(fvt);
		
//		System.out.println("========================at Controller=========================="+"fvt.getDiscussions().getD_id() :"+fvt.getDiscussions().getD_id()+"  fvt.getNormalMember().getAccount(): "+fvt.getNormalMember().getAccount()+"==================================================");

//		Integer memberId = fvt.getNormalMember().getId();
//		List<FavouriteDTO> fav = fService.findAllFavouriteById(memberId);
		
//		System.out.println("=================================================================="+fav.size()+"=============================================================");
//	    return fav;
		
	}
    
	@GetMapping("/discussion/ajax")
	public String ajaxPage() {
		return "discussion/ajax";
	}
	
	
    @ResponseBody
    @GetMapping("/upload/image/{id}")
    public ResponseEntity<byte[]> downloadImage(@PathVariable Integer id){
    	Images image = imageRepository.findById(id).orElse(null);
    	if (image == null) {
			return ResponseEntity.notFound().build();
		}
    	byte[] imageData = image.getImg_data();
    	return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageData);
    }
}
