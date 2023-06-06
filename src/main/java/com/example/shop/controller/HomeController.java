package com.example.shop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.PostMapping;

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

    @GetMapping("/loginUser")
    public String loginUser() {
        return "loginUser";
    }

    @GetMapping("/updateUser")
    public String updateUser() {
        return "userUpdate";
    }
}
