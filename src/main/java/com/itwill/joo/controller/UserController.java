package com.itwill.joo.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.joo.dto.user.UserCreateDto;
import com.itwill.joo.dto.user.UserDetailDto;
import com.itwill.joo.dto.user.UserUpdateDto;
import com.itwill.joo.service.MailService;
import com.itwill.joo.service.UserService;
	
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
	
	private final UserService userService;
	
	@GetMapping("/login")
	public String loginPage(@RequestParam(name = "errorMessage", required = false) String errorMessage, Model model) {
		model.addAttribute("errorMessage", errorMessage);
		return "user/login";
	}
	
	@GetMapping("/join")
	public String joinPage() {
		log.info("join()");
		
		return "user/join";
	}
	
	@PostMapping("/join")
	public String join(UserCreateDto dto, BindingResult bindingResult) {
		log.info("join({})", dto);
		
		if(bindingResult.hasErrors()) {
			System.out.println("error");
			return "user/join";
		}
		
		int result = userService.create(dto);
		log.info("result = {}", result);
		
		return "redirect:/";
	}
	
	@GetMapping("/findId")
	public String findId() {
		return "user/findId";
	}
	
	@PostMapping("/findId")
	@ResponseBody
	public String findId(@RequestParam("name") String name, @RequestParam("email") String email) {
		log.info("findId({}, {})", name, email);
		
		String loginId = userService.getLoginId(name, email);
		log.info("loginId = {}", loginId);
		
		return loginId;
	}
	
	@GetMapping("/findPassword")
	public String finaPassword() {
		return "user/findPassword";
	}
	
	@PostMapping("/findPassword")
	@ResponseBody
	public int sendPassword(@RequestParam("name") String name, @RequestParam("email") String email) {
		log.info("findPassword({}, {})", name, email);
		
		String loginId = userService.getLoginId(name, email);
		if(loginId == null || loginId.equals("0")) {
			return 0;
		}
		
		String code = MailService.generateTemporaryPassword();
		MailService.sendTemporaryPassword(email, code);
		log.info("code = {}", code);
		
		log.info("updatePassword({}, {})", loginId, code);
		int result = userService.updatePassword(loginId, code);
		
		return result;
	}
	
	@GetMapping("/myDetails")
	public String userDetails(Principal principal, Model model) {
		UserDetailDto dto = userService.getUserInfo(principal.getName());
		model.addAttribute("user", dto);
		
		return "user/details";
	}
	
	@PostMapping("/modify")
	@ResponseBody
	public int modifyUserInfo(@RequestBody UserUpdateDto dto, Principal principal) {
		log.info("modifyUserInfo({})", dto);
		
		int result = userService.updateUserInfo(dto, principal.getName());
		log.info("result = {}", result);
		
		return result;
	}
	
	@GetMapping("/withdrawal")
	public String deletePage(Principal principal, Model model) {
		log.info("deletePage()");
		
		UserDetailDto dto = userService.getUserInfo(principal.getName());
		model.addAttribute("user", dto);
		
		return "user/delete";
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public int delete(@RequestParam("id") long id) {
		log.info("delete({})" ,id);
		
		int result = userService.deleteUser(id);
		log.info("result = {}", result);
		
		return result;
	}
	
	@PostMapping("/logout")
	public void logout() {
		
	}

}
