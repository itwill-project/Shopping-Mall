package com.itwill.joo.dto.user;

import java.time.LocalDateTime;

import com.itwill.joo.domain.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class KakaoDto {
	
private long id;
	
	private String login_id; // 로그인 아이디
	
	private String uname; // 이름
	private String uemail; // 이메일
	private String uphone; // 전화번호
	
	private String ugrade; // 회원등급 (기본값: BRONZE)
	
	private long ucurrent_point; // 현재 포인트 (기본값: 0)
	private long utotal_point; // 누적 포인트 (기본값: 0)
	
	// 주소
	private String ustreet; // 도로명주소
	private String udetail_address; // 상세주소
	private String upostcode; // 우편번호
	
	// 사용자 역할 (ROLE_USER, ROLE_ADMIN, ROLE_SOCIAL)
	private String role;
	
	private int is_authenticated; // 사용자 인증 여부 (기본값: 0)
	
	private LocalDateTime created_time; // 회원 가입일자
	
	public static KakaoDto fromEntity(User user) {
		return KakaoDto.builder()
				.id(user.getId())
				.login_id(user.getLogin_id())
				.uname(user.getUname())
				.uemail(user.getUemail())
				.uphone(user.getUphone())
				.ugrade(user.getUgrade())
				.utotal_point(user.getUtotal_point())
				.ustreet(user.getUstreet())
				.udetail_address(user.getUdetail_address())
				.upostcode(user.getUpostcode())
				.role(user.getRole())
				.is_authenticated(user.getIs_authenticated())
				.created_time(user.getCreated_time())
				.build();
	}
	
}