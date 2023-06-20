package com.itwill.joo.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.joo.domain.Criteria;
import com.itwill.joo.domain.PageDTO;
import com.itwill.joo.dto.board.BoardDetailDto;
import com.itwill.joo.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // 생성자 자동 생성
@RequestMapping("/post") // "/post" 로 시작하는 주소 다처리
@Controller
public class PostController {
	
	private final BoardService boardService;

	@GetMapping("/postDetail")
	public void postDetail(long id, Principal principal, Model model) {
		boardService.count(id);
		BoardDetailDto dto = boardService.read(id);
		
		model.addAttribute("board", dto);
		
		if(principal != null)
			model.addAttribute("loginId", principal.getName());
	}
	
	@GetMapping("/postList")
	public void list(Criteria cri, Principal principal, Model model) {
		
		model.addAttribute("boards", boardService.select(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, boardService.getTotal(cri)));
		
		if(principal != null)
		model.addAttribute("loginId", principal.getName());
	}
	
	@GetMapping("/postNotice")
	public String postListNotice(Model model, Criteria cri) {
		cri.setBtype("공지");
		
		model.addAttribute("boards", boardService.selectByCategory(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, boardService.getTotalByCategory(cri)));
		
		return "post/postNotice";
	}
	
	@GetMapping("/postEvent")
	public String postListEvent(Model model, Criteria cri) {
		cri.setBtype("이벤트");
		
		model.addAttribute("boards", boardService.selectByCategory(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, boardService.getTotalByCategory(cri)));
		
		return "post/postEvent";
	}
	
	
	

}