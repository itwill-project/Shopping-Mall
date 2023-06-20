package com.itwill.joo.dto.board;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.itwill.joo.domain.Board;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardDetailDto {

	private long id;
	private long u_id; // 게시물 작성자 아이디
	
	private String btitle; // 게시물 제목
	private String bcontent; // 게시물 내용
	private String bimage1; // 이미지 배너
	private String bimage2; // 이미지 내용
	private String btype; // 게시물 타입(카테고리)
	
	private int bviewed; // 게시물 조회수
	
	private LocalDateTime bcreated_time; // 게시물 작성일자
	private LocalDateTime bmodified_time; // 게시물 수정일자
	private Timestamp bstart_time; // 이벤트 시작일자
	private Timestamp bend_time; // 이벤트 종료일자
	
	public static BoardDetailDto fromEntity(Board entity) {
		
		return BoardDetailDto.builder()
				.id(entity.getId())
				.btype(entity.getBtype())
				.btitle(entity.getBtitle())
				.bcontent(entity.getBcontent())
				.bcreated_time(entity.getBcreated_time())
				.bmodified_time(entity.getBmodified_time())
				.bviewed(entity.getBviewed())
				.bimage1(entity.getBimage1())
				.build();
		
	}
	
}










