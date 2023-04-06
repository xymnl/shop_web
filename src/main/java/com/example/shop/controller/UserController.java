package com.example.shop.controller;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;

@Controller
public class UserController {

    @Value("${api.server.url}")
    private String apiServer;

}
