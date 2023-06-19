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
public class QuestionReply {
	
	private long id;
	private long questionId; // 답변달 문의 아이디
	
	private String replyContent; // 답변 내용
	
	private LocalDateTime createdTime; // 답변 작성일자
	private LocalDateTime modifiedTime; // 답변 수정일자

}
