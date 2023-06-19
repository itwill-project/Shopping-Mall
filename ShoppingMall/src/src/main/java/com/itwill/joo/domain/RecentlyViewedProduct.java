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
	private long productId; // 최근 본 상품 아이디
	private long userId; // 사용자 아이디
	
	private LocalDateTime createdTime; // 상품 본 시간

}
