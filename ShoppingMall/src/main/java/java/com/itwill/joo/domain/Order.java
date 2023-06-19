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
public class Order {
	
	private long id;
	private long userId; // 주문한 사용자 아이디
	
	private int initialPrice; // 초기 상품 가격
	private int discountPrice; // 할인된 가격
	private int finalPrice; // 최종 지불 가격
	private int point; // 주문으로 얻은 포인트
	
	private String status; // 주문 상태
	
	private LocalDateTime createdTime; // 주문일자
}
