package com.itwill.joo.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.joo.domain.Product;
import com.itwill.joo.dto.AdminProductPageDto;
import com.itwill.joo.dto.ProductCreateDto;
import com.itwill.joo.dto.ProductListPageDto;
import com.itwill.joo.dto.ProductUpdateDto;
import com.itwill.joo.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/api/AdminProduct")
public class AdminProductRestController { 

	// 상품처리
	private final ProductService productService;

	// 상품삭제
	@DeleteMapping("/delete/{id}")
	public ResponseEntity<Integer> deleteProduct(@PathVariable long id) {
		log.info("제품삭제 id = {}",id);
		int result = productService.deleteProduct(id);
		return ResponseEntity.ok(result);
	}

	// 상품 수정
	@PutMapping("/update/{p_id}")
	public ResponseEntity<Integer> updateProduct(@RequestBody ProductUpdateDto dto) {
		log.info("제품수정 dto = {}", dto);
		int result = productService.updateProduct(dto);
		return ResponseEntity.ok(result);
	}
	
	// 상품 수정 모달 열기
	@GetMapping("/modify/{id}")
	public ResponseEntity<ProductCreateDto> modify(@PathVariable long id){
		ProductCreateDto dto = productService.readOneProductByid(id);
		log.info("readOne(dto= {})",dto);
		return ResponseEntity.ok(dto);
	}
	
	// 상품 전체 읽기
	@GetMapping("/productList")
	public ResponseEntity<List<ProductListPageDto>> read() {
		List<ProductListPageDto> list = productService.showAllProductsList();
		log.info("상품읽기, 상품갯수 = {}", list.size());
		return ResponseEntity.ok(list);
	}		
	
	//상품 검색버튼클릭시 리스트 like 검색
	@GetMapping("/search/{search}")
	public ResponseEntity<List<ProductListPageDto>> readSearch(@PathVariable String search) {
		List<ProductListPageDto>list = productService.adminReadProductBySearch(search);
		log.info("상품읽기, 상품갯수 = {}", list.size());
		return ResponseEntity.ok(list);
	}
	
	// 상품 제고없는순 정렬
	@GetMapping("/pstock")
	public ResponseEntity<List<ProductListPageDto>> readPstock(){
		List<ProductListPageDto> list = productService.showNoPstockProductsList();
		return ResponseEntity.ok(list);
	}
}
