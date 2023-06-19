package com.itwill.joo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.joo.dto.ProductDto;
import com.itwill.joo.dto.ProductListPageDto;
import com.itwill.joo.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // 생성자 자동 생성
@RequestMapping("/product") // "/post" 로 시작하는 주소 다처리
@Controller
public class ProductController {

	private final ProductService productService;
	
	@GetMapping("/productsList")
	public void productList(Model model) {
		List<ProductListPageDto> p = productService.showAllProductsList();
		model.addAttribute("products", p);

	}
	
	@GetMapping("/productsNewList")
	public void productsNewList(Model model) {
		List<ProductListPageDto> p = productService.showNewProductsLsit();
		log.info("dto{}", p);
		model.addAttribute("products", p);		
	}
	
	@GetMapping("/productsHotList")
	public void productsHotList(Model model) {
		List<ProductListPageDto> p = productService.showHotProductsLsit();
		log.info("dto{}", p);
		model.addAttribute("products", p);
	}

	@GetMapping("/productDetail")
	public void productsDetail(@RequestParam("p_id")long id, Model model) {
		log.info("id = {}",id);
		ProductDto p = productService.userReadOneProductByid(id);
		model.addAttribute("product", p);
	}
}
