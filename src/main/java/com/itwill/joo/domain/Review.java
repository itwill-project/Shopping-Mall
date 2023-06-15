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
	
	private long p_id; // 후기 작성한 상품 아이디
	private long o_id; // 주문 아이디
	private long u_id; // 후기 작성한 사용자 아이디
	
	private String rcontent; // 후기 내용
	private String review_image; // 후기에 올린 이미지 주소
	
	private int rratings; // 별점
	
	private LocalDateTime rcreated_time; // 후기 작성일자
	private LocalDateTime rmodified_time; // 후기 수정일자

}