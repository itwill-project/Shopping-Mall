package com.itwill.joo.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderProduct {
	
	private long id;
	private long productId; // 주문한 상품 아이디
	private long orderId; // 주문 아이디
	
	private int count; // 상품 수량
	private int price; // 상품 가격

}
