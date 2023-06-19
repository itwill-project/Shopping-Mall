package com.itwill.joo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.joo.domain.Board;
import com.itwill.joo.domain.Criteria;
import com.itwill.joo.dto.board.BoardCreateDto;
import com.itwill.joo.dto.board.BoardDetailDto;
import com.itwill.joo.dto.board.BoardListDto;
import com.itwill.joo.dto.board.BoardUpdateDto;
import com.itwill.joo.dto.review.ReviewAdminListDto;
import com.itwill.joo.repository.BoardRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class BoardService {
	
	private final BoardRepository boardRepository;

	public List<BoardListDto> select() {
		log.info("select()");
		
		return boardRepository.select();
	}
	
	public List<BoardListDto> select(Criteria cri) {
		
		return boardRepository.getListWithPaging(cri);
	}
	
	public List<BoardListDto> selectByCategory(Criteria cri) {
		
		return boardRepository.getListWithPagingByCategory(cri);
	}
	
	public int getTotal(Criteria cri) {
		
		return boardRepository.getTotalCount(cri);
	}
	
	public int getTotalByCategory(Criteria cri) {
		
		return boardRepository.getTotalCountByCategory(cri);
	}
	
	public int insert(BoardCreateDto dto) {
		
		return boardRepository.insert(dto.toEntity());
		
	}

	public BoardDetailDto read(Long id) {
		
		Board entity = boardRepository.selectById(id);
		
		BoardDetailDto dto = BoardDetailDto.fromEntity(entity);
		
		return dto;
	}
	
	public int delete(Long id) {
		
		return boardRepository.deleteById(id);
		
	}
	
	public int update(BoardUpdateDto dto) {
		
		return boardRepository.updateData(dto.toEntity());
	}
	
	public List<BoardDetailDto> selectCategory(String type) {
		List<Board> boardList = boardRepository.selectCategory(type);
		List<BoardDetailDto> list = new ArrayList<>();
		for(Board b : boardList) {
			BoardDetailDto dto = BoardDetailDto.fromEntity(b);
			list.add(dto);
		}
		
		return list;
	}

	public int count(Long id) {
		log.info("count({})", id);
		
		return boardRepository.updateViewCnt(id);
	}



	
	
	
	
	
	
}














