package com.itwill.joo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.joo.service.MailService;
import com.itwill.joo.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/validate")
public class ValidateController {
	
	private final UserService userService;
	
	@GetMapping("/loginId")
	@ResponseBody
	public int loginIdValidate(@RequestParam("loginId") String loginId) {
		log.info("loginIdValidate({})", loginId);
		
		int result = userService.validateLoginId(loginId);
		
		return result;
	}
	
	@GetMapping("/emailCheck")
	@ResponseBody
	public int checkEmail(@RequestParam("email") String email) {
		log.info("checkEmail({})", email);
		
		int result = userService.checkEmail(email);
		
		return result;
	}
	
	@PostMapping("/sendCode")
	@ResponseBody
	public String sendValidationCode(@RequestParam("email") String email) {
		log.info("sendValidationCode({})", email);
		
		// 인증 코드 생성
		String code = MailService.generateValidationNumber();
		log.info("code = {}", code);
		
		// 이메일 전송
		MailService.sendValidationCode(email, code);
		
		return code;
	}

}
