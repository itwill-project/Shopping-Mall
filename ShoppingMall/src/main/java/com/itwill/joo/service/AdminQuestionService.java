package com.itwill.joo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.joo.dto.question.QuestionAdminListDto;
import com.itwill.joo.dto.question.QuestionAnsweredUpdateDto;
import com.itwill.joo.repository.AdminQuestionRepository;

import lombok.RequiredArgsConstructor;

@Service 
@RequiredArgsConstructor 
public class AdminQuestionService {

	private final AdminQuestionRepository adminQuestionRepository;

	// 유저이름으로 된 리스트 반환
	public List<QuestionAdminListDto> readWithUsersName() {
		return adminQuestionRepository.selectWithUsersNameList();
	}

	// 답변안한 리스트 반환
	public List<QuestionAdminListDto> selectNoAnsweredFirst() {
		return adminQuestionRepository.selectNoAnsweredFirst();
	}

	// 모달띠우기
	public QuestionAdminListDto readWithName(long id) {
		return adminQuestionRepository.selectWithUsersNameOne(id);
	}

	// 답변하기
	public int answere(QuestionAnsweredUpdateDto dto) {
		return adminQuestionRepository.updateAnswere(dto.toEntity());
	}
	
	
	
}
