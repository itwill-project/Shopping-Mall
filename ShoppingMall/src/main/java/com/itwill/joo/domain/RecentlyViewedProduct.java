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
 * @author User
 *
 */
public class RecentlyViewedProduct {
	
	private long id;
	private long p_id; // 최근 본 상품 아이디
	private long u_id; // 사용자 아이디
	
	private LocalDateTime created_time; // 상품 본 시간

}
