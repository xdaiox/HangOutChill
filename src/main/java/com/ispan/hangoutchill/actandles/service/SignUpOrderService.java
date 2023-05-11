package com.ispan.hangoutchill.actandles.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.hangoutchill.actandles.dao.SignUpOrderRepository;

@Service
public class SignUpOrderService {
	@Autowired
	private SignUpOrderRepository suoRepository;

}
