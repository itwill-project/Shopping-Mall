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
	private long userId; // 게시물 작성자 아이디
	
	private String title; // 게시물 제목
	private String content; // 게시물 내용
	private String image1; // 이미지 배너
	private String image2; // 이미지 내용
	private String type; // 게시물 타입(카테고리)
	
	private int viewed; // 게시물 조회수
	
	private LocalDateTime createdTime; // 게시물 작성일자
	private LocalDateTime modifeidTime; // 게시물 수정일자
	private LocalDateTime startTime; // 이벤트 시작일자
	private LocalDateTime endTime; // 이벤트 종료일자

}
