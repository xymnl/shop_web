package com.example.shop.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {
	
	  @Value("${api.server.url}") 
	  private String apiServer;
	 
	@GetMapping("/inquiry")
	public String inquiry(Model model) throws Exception {
		 String url = apiServer + "board/admin/"; 
		 ResponseEntity response = new
		 RestTemplate().getForEntity(url, Object.class);
		  
		 List boardList = (List) response.getBody();
		 log.info("list = {}", boardList);
		  
		 model.addAttribute("boardList",boardList);

		return "inquiry";
	}
	
	@GetMapping("/inquiry_detail")
	public String injuiryDetail(Model model) throws Exception {
		int boardId = 3;
		String url = apiServer + "user/my-board/{"+boardId+"}";
		ResponseEntity response = new
		RestTemplate().getForEntity(url, Object.class);	
		
		List myboard = (List) response.getBody();
		log.info("myboard = {}", myboard);
		
		model.addAttribute("boardList",myboard);
		
		return "inquiry_detail";
	}
}
