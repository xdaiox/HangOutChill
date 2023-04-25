package com.ispan.hangoutchill.actandles.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
}
