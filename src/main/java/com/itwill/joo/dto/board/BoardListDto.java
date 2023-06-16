package com.itwill.joo.dto.board;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.itwill.joo.domain.Board;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// VO에 해당, 클래스로 설정(변동되는 모델 값)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardListDto {
	
	private long id;
	private long u_id; // 게시물 작성자 아이디
	
	private String btitle; // 게시물 제목
	private String bcontent; // 게시물 내용
	private String bimage1; // 이미지 배너
	private String bimage2; // 이미지 내용
	private String btype; // 게시물 타입(카테고리)
	
	private int bviewed; // 게시물 조회수
	
	private Timestamp bcreated_time; // 게시물 작성일자
	private Timestamp bmodified_time; // 게시물 수정일자
	private Timestamp bstart_time; // 이벤트 시작일자
	private Timestamp bend_time; // 이벤트 종료일자
	
	
	public static BoardListDto fromEntity(Board entity) {
		
		return BoardListDto.builder()
				.id(entity.getId())
				.btitle(entity.getBtitle())
				.bcontent(entity.getBcontent())
				.btype(entity.getBtype())
				.bcreated_time(entity.getBcreated_time())
				.bmodified_time(entity.getBmodified_time())
				.bend_time(entity.getBend_time())
				.bviewed(entity.getBviewed())
				.build();
	}
	
	
}












