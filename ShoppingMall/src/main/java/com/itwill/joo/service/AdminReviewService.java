package com.itwill.joo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.joo.dto.review.ReviewAdminListDto;
import com.itwill.joo.dto.review.ReviewReplyUpdateDto;
import com.itwill.joo.repository.AdminReviewRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service // -> 스프링 컨테이너에서 서비스 컴포넌트 객체를 생성하고 관리(필요한 곳에 주입).
@RequiredArgsConstructor // 2. (2) final로 선언된 필드를 초기화하는 생성자를 자동으로 만들어줌.@Slf4j
@Slf4j
public class AdminReviewService {

    // 생성자에 의한 의존성 주입
    private final AdminReviewRepository adminReviewRepository;
    
    // 유저 아이디 대신 이름으로 검색
    public List<ReviewAdminListDto> readWithUsersName(){
    	return adminReviewRepository.selectWithUsersNameList();
    }
    
    // 유저 아이디 대신 이름으로 검색
    public List<ReviewAdminListDto> selectNoAnsweredFirst(){
    	return adminReviewRepository.selectNoAnsweredFirst();
    }

	public ReviewAdminListDto readWithName(long id) {
		return adminReviewRepository.selectWithUsersNameOne(id);
	}

	public int addReviewReply(ReviewReplyUpdateDto dto) {
		return adminReviewRepository.addReviewReply(dto.toEntity());
	}
    
}
