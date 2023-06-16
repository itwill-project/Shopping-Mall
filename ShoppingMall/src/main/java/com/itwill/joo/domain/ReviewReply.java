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
public class ReviewReply {
	
	private long id;
	private long r_id; // 답변 작성한 후기 아이디
	
	private String content; // 후기 답변 내용
	
	private LocalDateTime rcreated_time; // 후기 답변 작성일자
	private LocalDateTime rmodified_time; // 후기 답변 수정일자

}
