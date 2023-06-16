package com.itwill.joo.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BasketProduct {
	
	private long id;
	private long b_id; // 장바구니 아이디
	private long p_id; // 장바구니에 담은 상품 아이디
	
	private int count; // 상품 개별 수량

}
