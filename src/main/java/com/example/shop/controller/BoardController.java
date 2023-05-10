package com.example.shop.controller;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {

	@Value("${api.server.url}")
	private String apiServer;
	@Setter
	@Getter
	private String tokens;

	@GetMapping("/inquiry")
	public String inquiry() {
		return "inquiry";
	}

	@GetMapping("/inquiry_detail/{id}")
	public String injuiryDetail(@PathVariable Long id,Model model){
		log.info("=====id=={}",id);
		model.addAttribute("idx",id);
		return "inquiry_detail";
	}
	@GetMapping("/create")
	public String inquiry_Create () {
		
		return "inquiry_create";
	}
}