package com.example.shop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class HomeController {


    @GetMapping("/admin_addItem")
    public String addItem() {
        return "amin_addItem";
    }
    @GetMapping("/test")
    public String test() {
        return "test";
    }

	
    @GetMapping("/")
    public String home() {
        return "home";
    }



    @GetMapping("/createUser")
    public String createUser() {
    	return "createUser";
    }

    
    @GetMapping("/shop_dairy")
    public String shopPage() {
    	return "products/shop_dairy";
    }
    
    @GetMapping("/detail")
    public String detailPage() {
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
    
    @GetMapping("/inquiry")
    public String inquiry() {
        return "inquiry";
    }

    /* === 테스트용 ===*/
    @GetMapping("/sample")
    public String sample() { return "sample"; }

    
    
}
