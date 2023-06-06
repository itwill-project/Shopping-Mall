package com.itwill.joo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // 생성자 자동 생성
@RequestMapping("/user") // "/post" 로 시작하는 주소 다처리
@Controller
public class UserController {

	@GetMapping("/login")
	public void login() {
		log.info("login()");
	}

	@PostMapping("/sign")
	public String sign() {
		return "redirect:/";
	}
	
	@GetMapping("/myBasket")
	public void basket() {
		
	}
	
	@GetMapping("/myGrade")
	public void grade() {
		
	}
	
	@GetMapping("/myOrder")
	public void order() {
		
	}
	
	@GetMapping("/myPrivate")
	public void Myprivate() {
		
	}
	
	@GetMapping("/myQuseries")
	public void quseries() {
		
	}
	
}
