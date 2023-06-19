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
public class Review {
	
	private long id;
	
	private long productId; // 후기 작성한 상품 아이디
	private long orderId; // 주문 아이디
	private long userId; // 후기 작성한 사용자 아이디
	
	private String content; // 후기 내용
	private String reviewImage; // 후기에 올린 이미지 주소
	
	private int ratings; // 별점
	
	private LocalDateTime createdTime; // 후기 작성일자
	private LocalDateTime modifiedTime; // 후기 수정일자

}
