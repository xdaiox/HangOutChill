package com.ispan.hangoutchill.actandles.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.hangoutchill.actandles.model.ActivitiesandLesson;
import com.ispan.hangoutchill.actandles.service.AALservice;

@Controller
public class AALcontroller {
	@Autowired
	private AALservice aalService;

	
	@GetMapping("/actandles/add")
	public String addAAL(Model model) {
		
		model.addAttribute("aal", new ActivitiesandLesson());
		
		return "aal/addAALPage";
	}
	
	@PostMapping("/actandles/post")
	public String postAAL(@RequestParam("imageFile") MultipartFile imageFile, @ModelAttribute("aal") ActivitiesandLesson aal,Model model) {
		
		try {
			aal.setImage(imageFile.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
			aal.setImage("".getBytes());
		}
		aalService.addAAL(aal);
		
		return "redirect:/actandles/postall";
	}
	
	@GetMapping("/actandles/postall")
	public String goShowAAL(@RequestParam(name="p",defaultValue = "1") Integer pagenumber, Model model) {
		Page<ActivitiesandLesson> page = aalService.findByPage(pagenumber);
		model.addAttribute("page",page);
		
		return "aal/showMyAaL";
	}
	
	@DeleteMapping("/actandles/delete")
	public String deleteAAL(@RequestParam Integer id) {
		aalService.deleteAALById(id);
		return "redirect:/actandles/postall";
	}
	
	@GetMapping("/actandles/edit")
	public String editPage(@RequestParam("id") Integer id,Model model) {
		ActivitiesandLesson aal = aalService.findMessagesById(id);
		model.addAttribute("aal",aal);
		
		return "aal/editAALPage";
	}
	
	@PutMapping("/actandles/edit")
	public String putEditedAAL(@ModelAttribute("aal") ActivitiesandLesson aal) {
		aalService.updateById(aal.getId() , aal);
		return "redirect:/actandles/postall";
	
	}
}
