package com.itwill.joo.repository;

import java.util.List;

import com.itwill.joo.domain.Review;
import com.itwill.joo.dto.review.ReviewAdminListDto;


public interface AdminReviewRepository {

  
  // 상세 문의 조회
  Review selectById(long id);
  int deleteById(long id);
  
  // 유저 번호를 통한 문의 조회
  List<Review> selectByUserId(long u_id);
  
  // QnA
  List<Review> selectWhereTypeProduct(long p_id);
  
  List<ReviewAdminListDto> selectWithUsersNameList();

  // id로 검색시 문의를 남긴 유저의 이름과 같이 반환(QuestionAdminListDto 타입객체)
  ReviewAdminListDto selectWithUsersNameOne(long id);
  
  // 문의 리스트 1. 미답변 우선, 2. 오래된 순서로 리스트 반환 
  List<ReviewAdminListDto> selectNoAnsweredFirst();
  
  // 업데이트
  int addReviewReply(Review entity);
}