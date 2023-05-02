package com.example.shop.controller;

import com.example.shop.lib.ApiInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ItemController {

    @Value("${api.server.url}")
    private String apiServer;


    @GetMapping("/item")
    public String item(Model model) throws Exception {

        /*Map<String, Object> params = new HashMap<>();*/

        //localhost:8090/user/item 으로 조회
        String url = apiServer + "user/item/";
        //외부 url을 요청하는 인터페이스
        ResponseEntity response = new RestTemplate().getForEntity(url, Object.class);

        //요청한 url의 반환값을 가져옴
        List list = (List) response.getBody();

        //요청한 반환값 log로 조회
        log.info("list = {}", list);

        //반환값을 model에 넣어서 view에 전달
        model.addAttribute("list", list);

        // webapp/WEB-INF/jsp/item.jsp
        return "item";
    }

}
