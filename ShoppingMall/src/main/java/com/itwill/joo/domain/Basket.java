package com.itwill.joo.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Basket {
	
	private long id;
	private long u_id; // 사용자 아이디
	private int estimated_price; // 현재 장바구니에 담긴 상품들 총 가격

}
