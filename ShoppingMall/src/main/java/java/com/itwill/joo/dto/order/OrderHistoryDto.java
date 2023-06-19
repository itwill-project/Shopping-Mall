package com.itwill.joo.dto.order;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderHistoryDto {

	private long id;

	private String ptitle_image; // 주문 상품 이미지
	private String pname; // 상품 이름
	private int pstock; // 수량(임시로 재고 사용)
	private int pprice; // 상품 가격
	private Timestamp ocreated_time; // 주문 일자
	private Timestamp dmodified_time; // 취소 일자(배송 업데이트 시간)
	private String dstatus; // 배송 상태

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