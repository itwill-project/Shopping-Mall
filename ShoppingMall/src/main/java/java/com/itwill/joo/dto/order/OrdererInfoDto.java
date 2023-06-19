package com.itwill.joo.dto.order;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrdererInfoDto {

	private long id;	

	private String uname; // 주문자 정보
	private int upostcode; // 주문자 우편번호
	private String ustreet; // 주문자 주소
	private String udetail_address; // 주문자 상세주소
	private String uphone; // 주문자 연락처
	private String uemail; // 주문자 이메일
	private int ucurrent_point; // 주문자 현재 포인트



//	public Product toEntity() {
//		return Product.builder()
//				.login_id(loginId)
//				.upassword(password)
//				.uname(name)
//				.uemail(email)
//				.uphone(phone)
//				.ustreet(street)
//				.udetail_address(detailAddress)
//				.upostcode(postcode)
//				.role("ROLE_USER")
//				.build();
//	}

}