package com.xinyi.boot.cicdtest.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class TestController {
    @GetMapping("/test")
    public String test(){
        return "哈哈哈, 恭喜你访问成功了喔!!!!!!";
    }
}
