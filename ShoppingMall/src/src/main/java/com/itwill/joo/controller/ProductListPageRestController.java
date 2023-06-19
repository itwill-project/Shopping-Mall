package com.itwill.joo.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.joo.dto.ProductListPageDto;
import com.itwill.joo.dto.ProductSearchDto;
import com.itwill.joo.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/api/ProductList")
public class ProductListPageRestController {
	
	private final ProductService productService;
	
	// 신상 리스트
	@GetMapping("/showNewList")
	public ResponseEntity<List<ProductListPageDto>> readNew() {
		log.info("신상 상품 리스트 페이지 메서드");
		List<ProductListPageDto> list = productService.showNewList();
		return ResponseEntity.ok(list);
	}
	// 인기 리스트
	@GetMapping("/showHotList")
	public ResponseEntity<List<ProductListPageDto>> readHot() {
		log.info("인기 상품 리스트 페이지 메서드");
		List<ProductListPageDto> list = productService.showHotList();
		return ResponseEntity.ok(list);
	}
	// 전통주 리스트
	@GetMapping("/showOldList")
	public ResponseEntity<List<ProductListPageDto>> readOld() {
		log.info("전통주 상품 리스트 페이지 메서드");
		List<ProductListPageDto> list = productService.showOldList();
		return ResponseEntity.ok(list);
	}
	// 소주 리스트
	@GetMapping("/showSojuList")
	public ResponseEntity<List<ProductListPageDto>> readSoju() {
		log.info("소주 상품 리스트 페이지 메서드");
		List<ProductListPageDto> list = productService.showSojuList();
		return ResponseEntity.ok(list);
	}
	// 맥주 리스트
	@GetMapping("/showBearList")
	public ResponseEntity<List<ProductListPageDto>> readBear() {
		log.info("맥주 상품 리스트 페이지 메서드");
		List<ProductListPageDto> list = productService.showBearList();
		return ResponseEntity.ok(list);
	}
	// 기타 리스트
	@GetMapping("/showAnotherList")
	public ResponseEntity<List<ProductListPageDto>> readOther() {
		log.info("기타 상품 리스트 페이지 메서드");
		List<ProductListPageDto> list = productService.showAnotherList();
		return ResponseEntity.ok(list);
	}
	
	// 검색 리스트
	@GetMapping("/showSearchList/{search}")
	public ResponseEntity<List<ProductListPageDto>> readSearch(@PathVariable String search, ProductSearchDto dto) {
		log.info("검색어  = {}", search);
		dto.setSearchWord("%"+search+"%");
		log.info("dto  = {}", dto);
		List<ProductListPageDto> list = productService.ReadProductBySearchDto(dto);
		return ResponseEntity.ok(list);
	}

}
