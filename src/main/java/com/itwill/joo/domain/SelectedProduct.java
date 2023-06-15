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
 * 
 * @author 
 *
 */
public class SelectedProduct {
	
	private long id;
	
	private long u_id; // 사용자 아이디
	private long p_id; // 상품 아이디
	
	private LocalDateTime created_time; // 장바구니에 담긴 시간

}
