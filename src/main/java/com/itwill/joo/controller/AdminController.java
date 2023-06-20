package com.itwill.joo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.joo.dto.board.BoardCreateDto;
import com.itwill.joo.dto.board.BoardDetailDto;
import com.itwill.joo.dto.board.BoardUpdateDto;
import com.itwill.joo.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // 생성자 자동 생성
@RequestMapping("/admin") 
@Controller
public class AdminController {
	
	private final BoardService boardService;
	
	@GetMapping("/adminMain")
	public void AdmainMain() {
		log.info("AdmainMain()");
	}
	
	@GetMapping("/postModify")
	public void postModify(Long id, Model model) {
		
		BoardDetailDto dto = boardService.read(id);
		
		model.addAttribute("board", dto);
		
	}
	
	@GetMapping("/postCreate")
    public void insert() {
        log.info("GET: create()");
    }
	
	@PostMapping("/postCreate")
	public String insert(BoardCreateDto dto) {
		
		log.info("POST: insert({})", dto);
		
		int result = boardService.insert(dto);
		log.info("result = {}", result);
		
		return "redirect:/post/postList";
		
	}
	
	@PostMapping("/update")
	public String update(BoardUpdateDto dto, Long id) {
		log.info("update(dto={})", dto);
		
		int result = boardService.update(dto);
		log.info("업데이트 결과 = {}", result);
		
		return "redirect:/post/postList";
	}
	
	@PostMapping("/delete")
	public String delete(Long id) {
		
		int result = boardService.delete(id);
		
		return "redirect:/post/postList";
	}

}