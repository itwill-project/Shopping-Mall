package com.itwill.joo.dto.user;

import com.itwill.joo.domain.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserCreateDto {
	
	private long id;
	
	private String loginId; // 로그인 아이디
	private String password; // 비밀번호
	private String name; // 이름
	private String email; // 이메일
	private String phone; // 전화번호
	private String street; // 도로명주소
	private String detailAddress; // 상세주소
	private String postcode; // 우편번호
	private String role; // 사용자 역할 (ROLE_USER, ROLE_ADMIN, ROLE_SOCIAL)
	
	public User toEntity() {
		return User.builder()
				.login_id(loginId)
				.upassword(password)
				.uname(name)
				.uemail(email)
				.uphone(phone)
				.ustreet(street)
				.udetail_address(detailAddress)
				.upostcode(postcode)
				.role("ROLE_USER")
				.build();
	}
	
}
