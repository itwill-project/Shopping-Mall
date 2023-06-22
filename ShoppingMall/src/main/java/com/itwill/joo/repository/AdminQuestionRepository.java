package com.itwill.joo.repository;

import java.util.List;

import com.itwill.joo.domain.Question;
import com.itwill.joo.dto.question.QuestionAdminListDto;

public interface AdminQuestionRepository {

	// 세엽
	List<QuestionAdminListDto> selectWithUsersNameList();

	// id로 검색시 문의를 남긴 유저의 이름과 같이 반환(QuestionAdminListDto 타입객체)
	QuestionAdminListDto selectWithUsersNameOne(long id);

	// 문의 리스트 1. 미답변 우선, 2. 오래된 순서로 리스트 반환
	List<QuestionAdminListDto> selectNoAnsweredFirst();

	// 업데이트
	int updateAnswere(Question entity);
	
}
