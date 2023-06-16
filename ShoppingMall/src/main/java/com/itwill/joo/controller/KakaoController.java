package com.itwill.joo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.joo.dto.user.KakaoDto;
import com.itwill.joo.dto.user.UserCreateDto;
import com.itwill.joo.service.KakaoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/kakao")
public class KakaoController {

	KakaoDto userInfo = null;

	private final KakaoService kakaoService;

	@RequestMapping(value = "")
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session) {
		System.out.println("####### " + code);

		String access_Token = kakaoService.getAccessToken(code);
		userInfo = kakaoService.getuserinfo(access_Token);

		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.getUname());
		System.out.println("###email#### : " + userInfo.getUemail());

		if (userInfo.getRole() == null) {
			return "redirect:/kakao/kakaoSignup";
		}

		return "index";
	}

	@GetMapping("/kakaoSignup")
	public String kakaoSignup(Model model) {
		model.addAttribute("loginId", userInfo.getLogin_id());
		model.addAttribute("name", userInfo.getUname());
		model.addAttribute("email", userInfo.getUemail());

		return "user/kakaoSignup";
	}

	@PostMapping("/join")
	public String kakaoSignup(UserCreateDto dto) {
		log.info("kakaoSignup({})", dto);

		int result = kakaoService.createKakaoUser(dto);
		log.info("result = {}", result);

		return "redirect:/";
	}

}
