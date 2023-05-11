package com.ispan.hangoutchill.actandles.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ispan.hangoutchill.actandles.service.SignUpOrderService;

@Controller
public class SignUpOrderController {
	
	@Autowired
	private SignUpOrderService suoService;

}
