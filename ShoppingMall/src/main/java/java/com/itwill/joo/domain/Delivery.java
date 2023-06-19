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
public class Delivery {
	
	private long id;
	private long orderId; // 주문 아이디
	
	private String deliveryCode; // 송장 번호
	private String name; // 수령인 이름
	private String phone; // 수령인 전화번호
	private String message; // 배송 메세지
	
	// 배송 받을 주소
	private String street; // 도로명주소
	private String detailAddress; // 상세주소
	private String postcode; // 우편번호
	
	private int price; // 배송비
	private int type; // 배송 타입
	
	private String status; // 배송 상태
	
	private LocalDateTime createdTime; // 배송 시작일자
	private LocalDateTime modifiedTime; // 배송 상태 변경일자

}
