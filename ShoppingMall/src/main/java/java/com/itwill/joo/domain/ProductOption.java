package com.itwill.joo.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
/**
 * ProductOption 클래스 작성
 * @author 서원준/김세엽
 *
 */
public class ProductOption {
	
	private long id; // (PK값)
	private long productId; // 상품 아이디 (만들어진 상품의 ID와 같아야 한다.)
	
	private String volume; // 상품 용량 (옵션을 구분하는 핵심값)
	
	private int price; // 상품 가격 (추후 보여질때는 0이 3개마다 ,(쉼표)가 보이도록 해야한다.)
	private int stock; // 상품 재고 (기본값: 0)

}
