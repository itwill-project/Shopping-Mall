package com.itwill.joo.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.joo.dto.review.ReviewAdminListDto;
import com.itwill.joo.dto.review.ReviewReplyUpdateDto;
import com.itwill.joo.service.AdminReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/api/AdminReview")
public class AdminReviewRestController {

	private final AdminReviewService adminReviewService;
	
    // 관리자 페이지에서 보여질 문의리스트
	@GetMapping("/ReviewList")
	public ResponseEntity<List<ReviewAdminListDto>> read() {
		List<ReviewAdminListDto>list = adminReviewService.readWithUsersName();
		return ResponseEntity.ok(list);
	}
	
	@GetMapping("/NoAnswered")
	public ResponseEntity<List<ReviewAdminListDto>> readNoAnswere() {
		List<ReviewAdminListDto>list = adminReviewService.selectNoAnsweredFirst();
		return ResponseEntity.ok(list);
	}
	
	// 문의 답하기 모달
	@GetMapping("/modify/{id}")
	public ResponseEntity<ReviewAdminListDto> modify(@PathVariable long id){
		ReviewAdminListDto dto = adminReviewService.readWithName(id);
		log.info("read(dto= {})",dto);
		return ResponseEntity.ok(dto);
	}

	// 답변 완료(review 수정)
	@PostMapping("/answer/{r_id}")
	@ResponseBody
	public ResponseEntity<Integer> updateProduct(@RequestBody ReviewReplyUpdateDto dto) {
		
		log.info("답변완료 dto = {}", dto);
		int result = adminReviewService.addReviewReply(dto);
		return ResponseEntity.ok(result);
	}
	
	 
}
