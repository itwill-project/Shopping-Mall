package com.itwill.joo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // 생성자 자동 생성
@RequestMapping("/product") // "/post" 로 시작하는 주소 다처리
@Controller
public class ProductController {

	@GetMapping("/productsList")
	public void productList() {

	}

	@GetMapping("/productDetail")
	public void productsDetail() {

	}

	@GetMapping("/productsHotList")
	public void productsHotList() {

	}

	@GetMapping("/productsNewList")
	public void productsNewList() {

	}

}