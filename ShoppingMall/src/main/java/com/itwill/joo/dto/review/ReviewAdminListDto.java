package com.itwill.joo.dto.review;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReviewAdminListDto {

	// 답변아이디, 유저 아이디
	private long r_id;

	// 작성자의 이름을 받아 사용
	private String u_id;

	private String rcontent;
	private String is_answered;

	private Timestamp rcreated_time;
	private Timestamp rreplycreate_time;

}