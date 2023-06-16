package com.itwill.joo.dto.board;

import com.itwill.joo.domain.Board;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class BoardUpdateDto {

	private long id;
	private long u_id; // 게시물 작성자 아이디
	
	private String btitle; // 게시물 제목
	private String bcontent; // 게시물 내용
	private String btype; // 게시물 타입(카테고리)
	
	public Board toEntity() {
		
		return Board.builder()
				.id(id)
				.btype(btype)
				.btitle(btitle)
				.bcontent(bcontent)
				.build();
	}
	
	
}
