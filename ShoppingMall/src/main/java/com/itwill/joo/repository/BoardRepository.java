package com.itwill.joo.repository;

import java.util.List;

import com.itwill.joo.domain.Board;
import com.itwill.joo.domain.Criteria;
import com.itwill.joo.dto.board.BoardListDto;

public interface BoardRepository {
	
	List<BoardListDto> select();
	
	int insert(Board board);
	
	Board selectById(Long bno);
	
	int deleteById(Long bno);
	
	int updateData(Board board);
	
	int updateViewCnt(Long bno);
	
	List<Board> selectCategory(String type);
	
	List<BoardListDto> getListWithPaging(Criteria cri);
	
	List<BoardListDto> getListWithPagingByCategory(Criteria cri);
	
	int getTotalCount(Criteria cri);
	
	int getTotalCountByCategory(Criteria cri);
	
}
