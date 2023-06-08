package com.example.shop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class HomeController {

	@GetMapping("/")
    public String home() {
        return "home";
    }
	
	@GetMapping("/mypage")
	public String myPage() {
		return "myPage";
	}

    @GetMapping("/admin_addItem")
    public String addItem() {
        return "admin_addItem";
    }
    @GetMapping("/admin_updateItem")
    public String updateItem() {
        return "admin_updateItem";
    }
    @GetMapping("/admin_updateItem/{id}")
    public String updateItemGet(@PathVariable Long id,Model model) {
        model.addAttribute("idx",id);
        return "admin_updateItem_get";
    }
    @GetMapping("/admin_deleteItem")
    public String deleteItem() {
        return "admin_deleteItem";
    }
    
    @GetMapping("/createUser")
    public String createUser() {
    	return "createUser";
    }
    
    @GetMapping("/shop_dairy")
    public String shopPage() {
    	return "products/shop_dairy";
    }
    
    @GetMapping("/detail/{id}")
	public String inquiryDetail(@PathVariable Long id,Model model){
		log.info("=====id=={}",id);
		model.addAttribute("idx",id);
		return "products/shop-detail";
	}
    
    @GetMapping("/wish")
    public String wisthPage() {
    	return "wish";
    }

    @GetMapping("/order")
    public String order() {
        return "order";
    }
    
    /* === 테스트용 ===*/
    @GetMapping("/sample")
    public String sample() { return "sample"; }

    //일반 로그인
    @GetMapping("/loginUser")
    public String loginUser() {
        return "loginUser";
    }

    //소셜 로그인
    @GetMapping("/loginUser/oauth")
    public String loginOAuthUser(@RequestParam String token, Model model) {

        model.addAttribute("token", token);

        System.out.println("token = " + token);

        return "loginOAuthUser";
    }

    @GetMapping("/updateUser")
    public String updateUser() {
        return "userUpdate";
    }
}
