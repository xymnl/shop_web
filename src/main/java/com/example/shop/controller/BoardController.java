package com.example.shop.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {

	@Value("${api.server.url}")
	private String apiServer;


	@GetMapping("/inquiry")
	public String inquiry() {
		return "inquiry";
	}
	
	@GetMapping("/admin_inquiry")
	public String adminInquiry() {
		return "admin_inquiry";
	}

	@GetMapping("/inquiry_detail/{id}")
	public String inquiryDetail(@PathVariable Long id,Model model){
		log.info("=====id=={}",id);
		model.addAttribute("idx",id);
		return "detail";
	}
	
	@GetMapping("/admin_inquiry_detail/{id}")
	public String adminInquiryDetail(@PathVariable Long id,Model model){
		log.info("=====id=={}",id);
		model.addAttribute("idx",id);
		return "admin_inquiry_detail";
	}
	
	@GetMapping("/inquiry/create")
	public String inquiry_Create () {
		
		return "inquiry_create";
	}
}