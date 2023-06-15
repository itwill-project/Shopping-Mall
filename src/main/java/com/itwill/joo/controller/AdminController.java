package com.itwill.joo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // 생성자 자동 생성
@RequestMapping("/admin") 
@Controller
public class AdminController {

	@GetMapping("/adminMain")
	public void AdmainMain() {
		log.info("AdmainMain()");
	}

}