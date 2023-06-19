package com.itwill.joo.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
/**
 * User 클래스 작성
 * @author 서원준
 *
 */
public class User {
	
	private long id;
	
	private String login_id; // 로그인 아이디
	private String upassword; // 비밀번호
	
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
	private LocalDateTime modified_Time; // 회원정보 수정일자
	
	// 비밀번호 재설정 시 사용할 메서드
	public void setPassword(String upassword) {
		this.upassword = upassword;
	}

}
