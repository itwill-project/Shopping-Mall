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
 * Order 클래스 작성
 * @author 김우현
 *
 */
public class Order {
	
	private long id;
	private long u_id; // 주문한 사용자 아이디
	
	private int oinitial_price; // 초기 상품 가격
	private int odiscount_price; // 할인된 가격
	private int ofinal_price; // 최종 지불 가격
	private int opoint; // 주문으로 얻은 포인트
	
	private String ostatus; // 주문 상태
	
	private LocalDateTime ocreated_time; // 주문일자
}