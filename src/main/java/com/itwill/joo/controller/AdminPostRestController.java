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

import com.itwill.joo.dto.board.BoardDetailDto;
import com.itwill.joo.dto.board.BoardListDto;
import com.itwill.joo.dto.board.BoardUpdateDto;
import com.itwill.joo.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/api/AdminPost")
public class AdminPostRestController {

	private final BoardService boardService;
	
    // 관리자 페이지에서 보여질 문의리스트
	@GetMapping("/postList")
	public ResponseEntity<List<BoardListDto>> read() {
		List<BoardListDto>list = boardService.select();
		return ResponseEntity.ok(list);
	}
	
	// 상품삭제
	@DeleteMapping("/delete/{id}")
	public ResponseEntity<Integer> deleteProduct(@PathVariable long id) {
		log.info("제품삭제 id = {}",id);
		int result = boardService.delete(id);
		return ResponseEntity.ok(result);
	}

	// 상품 수정
	@PutMapping("/update/{id}")
	public ResponseEntity<Integer> updateProduct(@RequestBody BoardUpdateDto dto) {
		log.info("제품수정 dto = {}", dto);
		int result = boardService.update(dto);
		return ResponseEntity.ok(result);
	}
	
	// 상품 수정 모달 열기
	@GetMapping("/modify/{id}")
	public ResponseEntity<BoardDetailDto> modify(@PathVariable long id){
		BoardDetailDto dto = boardService.read(id);
		log.info("readOne(dto= {})",dto);
		return ResponseEntity.ok(dto);
	}
	
	 
}
