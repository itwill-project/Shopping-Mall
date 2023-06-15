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
public class Question {
	
	private long id;
	private long u_id; // 문의 작성한 사용자 아이디
	private long p_id; // 상품관련 문의일 경우 상품 아이디
	
	private String qtitle; // 문의 제목
	private String qcontent; // 문의 내용
	private String qtype; // 문의 유형
	
	// ERD에 없는데 필요할거 같아서 새로 추가
	private int is_answered; // 답변 완료된 문의 인지 확인 (0 -> 미완료, 1 -> 답변완료) (기본값: 0)
	
	private LocalDateTime qcreated_time; // 문의 작성일자
	private LocalDateTime qmodified_time; // 문의 수정일자

}
