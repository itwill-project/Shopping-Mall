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
public class Board {
	
	private long id;
	private long u_id; // 게시물 작성자 아이디
	
	private String btitle; // 게시물 제목
	private String bcontent; // 게시물 내용
	private String bimage1; // 이미지 배너
	private String bimage2; // 이미지 내용
	private String btype; // 게시물 타입(카테고리)
	
	private int bviewed; // 게시물 조회수
	
	private LocalDateTime bcreated_time; // 게시물 작성일자
	private LocalDateTime bmodifeid_time; // 게시물 수정일자
	private LocalDateTime bstart_time; // 이벤트 시작일자
	private LocalDateTime bend_time; // 이벤트 종료일자

}
