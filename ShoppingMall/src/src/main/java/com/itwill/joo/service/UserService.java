package com.itwill.joo.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.itwill.joo.domain.User;
import com.itwill.joo.dto.user.UserCreateDto;
import com.itwill.joo.dto.user.UserDetailDto;
import com.itwill.joo.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {
	
	private final BCryptPasswordEncoder passwordEncoder;
	private final UserRepository userRepository;
	
	// 사용자가 로그인 시에 입력한 아이디를 가지고 있는 User 객체를 DB에서 찾아 리턴
	// 해당되는 객체가 없으면 null을 리턴
	public User select(String loginId) {
		return userRepository.selectUserByLoginId(loginId);
	}
	
	// 사용자의 상세 정보를 가져오는 메서드
	public UserDetailDto getUserInfo(String loginId) {
		User user = userRepository.selectUserByLoginId(loginId);
		return UserDetailDto.fromEntity(user);
	}
	
	public String getLoginId(String name, String email) {
		return userRepository.findLoginIdByEmailAndName(name, email);
	}
	
	// 이메일 중복 여부 체크
	// 사용 가능한 이메일이면 1, 이미 사용중인 이메일이면 0을 리턴
	public int checkEmail(String email) {
		User user = userRepository.selectUserByEmail(email);
		if(user == null) {
			return 1;
		}
		return 0;
	}
	
	// 아이디 중복 여부 체크
	// 사용 가능한 아이디이면 1, 이미 사용중인 아이디이면 0을 리턴
	public int validateLoginId(String loginId) {
		User user = userRepository.selectUserByLoginId(loginId);
		if(user == null) {
			return 1;
		}
		return 0;
	}
	
	// 사용자의 회원가입 정보를 DB에 저장하는 메서드
	public int create(UserCreateDto dto) {
		String password = passwordEncoder.encode(dto.getPassword());
		dto.setPassword(password);
		dto.setRole("ROLE_USER");
		User user = dto.toEntity();
		
		return userRepository.createUser(user);
	}

}
