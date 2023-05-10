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
	public String inquiry(Model model, @RequestParam("tokenname") String tokenname) throws Exception {
		String url = apiServer + "board/user/my-board";
		setTokens(tokenname);
		HttpHeaders headers=new HttpHeaders();
		headers.set("Authorization","Bearer "+tokenname);
		HttpEntity<?> request = new HttpEntity<>(headers);

		ResponseEntity response = new RestTemplate().exchange(url,HttpMethod.GET,request,Object.class);

		List boardList = (List) response.getBody();
		log.info("list = {}", boardList);

		model.addAttribute("boardList",boardList);

		return "inquiry";
	}

	@GetMapping("/inquiry_detail")
	public String injuiryDetail(Model model, @RequestParam("idx") String idx) throws Exception {
		log.info("==idx===={}========",idx);
		String tokens1 = getTokens();
		log.info("==tokens1===={}========",tokens1);
		String url = apiServer + "board/user/my-board/"+idx;
		HttpHeaders headers=new HttpHeaders();
		headers.set("Authorization","Bearer "+tokens1);
		HttpEntity<?> request = new HttpEntity<>(headers);

		ResponseEntity response = new RestTemplate().exchange(url,HttpMethod.GET,request,Object.class);

		Object myboard =  response.getBody();
		log.info("myboard = {}", myboard);

		model.addAttribute("myboard",myboard);

		return "inquiry_detail";
	}
	@GetMapping("/create")
	public String inquiry_Create () {
		
		return "inquiry_create";
	}
}