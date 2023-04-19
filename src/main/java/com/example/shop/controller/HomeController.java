package com.example.shop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/test")
    public String test() {
        return "home";
    }
    
    @GetMapping("/createUser")
    public String createUser() {
    	return "createUser";
    }

    @GetMapping("/order")
    public String order() {
        return "order";
    }

    /* === 테스트용 ===*/
    @GetMapping("/sample")
    public String sample() { return "sample"; }
    
    
}
