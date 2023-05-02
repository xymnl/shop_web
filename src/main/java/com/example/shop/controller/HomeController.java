package com.example.shop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;



@Controller
@RequiredArgsConstructor
public class HomeController {

	
    @GetMapping("/test")
    public String test() {
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

    /* === 테스트용 ===*/
    @GetMapping("/sample")
    public String sample() { return "sample"; }

    @GetMapping("/cart")
    public String cart() { return "cart"; }
    
    
}
