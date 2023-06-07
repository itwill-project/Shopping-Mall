package com.itwill.joo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // 생성자 자동 생성
@RequestMapping("/questions") // "/questions" 로 시작하는 주소 다처리
@Controller
public class QuestionController {

    @GetMapping("/questionsList")
    public void questionsList() {
        log.info("GET: questionsList()");
    }
    
    @GetMapping("/questionsDetail")
    public void questionsDetail() {
        log.info("GET:questionsDetail");
    }
    
    @GetMapping("/questionCreate")
    public void questionCreate() {
        log.info("GET: questionCreate()");
    }
    
//    @PostMapping("/questionCreate") 
//        public String questionCreate(QuestionCreateDto dto) {
//        log.info("POST: questionCreate()");
//        
//        return "redirect:/";
//    }
    
    
    
    
    
}
