package com.itwill.joo.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.joo.dto.review.ReplyCreateDto;
import com.itwill.joo.service.ReplyService;
import com.itwill.joo.service.ReviewService;
import com.itwill.joo.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/reply")
@RequiredArgsConstructor
@Controller
public class ReplyController {
	
	private final ReplyService replyService;
	
	@PostMapping("/create")
	public ResponseEntity<Integer> createReply(@RequestBody ReplyCreateDto dto) {
		log.info("createReply(dto={})", dto);
        
        replyService.create(dto);
        
        return ResponseEntity.ok(1);
    }
	
}
