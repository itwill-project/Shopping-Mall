package com.itwill.joo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // 생성자 자동 생성
@RequestMapping("/post") // "/post" 로 시작하는 주소 다처리
@Controller
public class PostController {

	@GetMapping("/postDetail")
	public void postDetail() {
	}

	@GetMapping("/postList")
	public void postList() {
	}
	
}