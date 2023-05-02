package com.example.shop.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class HeaderController {
    @Value("${api.server.url}")
    private String apiServer;

    // localhost:8090/user/login
    @GetMapping("/user/login")
    public String header(Model model) {

        String url = apiServer + "user/login";
        ResponseEntity response = new RestTemplate().getForEntity(url, Object.class);
        List list = (List) response.getBody();
        log.info("list = {}", list);
        model.addAttribute("list", list);


        return "header";
    }

}
