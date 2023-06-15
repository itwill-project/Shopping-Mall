package com.itwill.joo.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.joo.dto.review.ReviewCreateDto;
import com.itwill.joo.dto.review.ReviewListDto;
import com.itwill.joo.service.ReviewService;
import com.itwill.joo.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/review")
@RequiredArgsConstructor
@Controller
public class ReviewController {
	
	private final ReviewService reviewService;
	private final UserService userService;
	
	@GetMapping("/create")
	public void create() {
		log.info("Get: create()");
	}
			
	@PostMapping("/create")
	public String create(ReviewCreateDto dto) {
	    log.info("REVIEW: create({})", dto);
	    
	    
	    return "redirect:/joo";
	}
	
	
	@GetMapping("/list")
	public String getReviewList(Principal principal, Model model) {

		
		return "review/list";
	}

	@PostMapping("/review/upload")
	public String handleFileUpload(@RequestParam("file") MultipartFile file) {
	    // 파일 업로드 및 처리 로직 작성
	    if (!file.isEmpty()) {
	        try {
	            byte[] bytes = file.getBytes();
	            // 파일 저장 로직 작성

	            // 파일 업로드 성공 시
	            return "성공";

	        } catch (IOException e) {
	            // 파일 업로드 실패 시
	        	return "실패";
	        }
	    } else {
	        // 업로드된 파일이 없는 경우 처리
	    }
	    
	    // 파일 업로드 처리 후 리다이렉트 또는 응답 페이지 반환
		return "redirect:/review/list";
	}

	@GetMapping("/")
	public String mainPage(@ModelAttribute("message") String message, Model model) {
	    // 메시지를 뷰에 전달
	    model.addAttribute("message", message);

	    // 메인 페이지 뷰를 반환
	    return "main";
	}
	
}














