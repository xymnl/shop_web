package com.example.shop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/test")
    public String test() {
        return "home";
    }

    @GetMapping("/order")
    public String order() {
        return "order";
    }
}
