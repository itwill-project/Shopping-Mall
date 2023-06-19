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
 * Payment 클래스 작성
 * @author 서원준
 *
 */
public class Payment {
	
	private long id;
	private long orderId; // 주문 아이디
	
	private String status; // 결제 상태
	
	private LocalDateTime createdTime; // 결제 일자

}
