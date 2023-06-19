package com.itwill.joo.repository;

import java.util.List;

import com.itwill.joo.domain.Question;
import com.itwill.joo.dto.QuestionAdminListDto;

//application-context.xml에서 scan하는 패키지에 있기 때문에
//인터페이스를 구현하는 클래스가 MyBatis에 의해서 자동으로 만들어짐.
//question-mapper.xml 파일에서 설정된 id와 메서드 이름이 같으면
//해당 아이디의 SQL 문장을 실행하는 구현 메서드를 만들어줌.
public interface QuestionRepository {

  // 상품문의
    
  // 문의 작성 
  int insert(Question question);
  
  List<Question> selectOrderByDesc();
  
  // 상세 문의 조회
  Question selectById(long id);
  int updateTitleAndContent(Question question);
  int deleteById(long id);
  
  // 유저 번호를 통한 문의 조회
  List<Question> selectByUserId(long u_id);
  
  // QnA
  List<Question> selectWhereTypeProduct(long p_id);
  List<Question> selectWhereTypeQnA();
  
  List<QuestionAdminListDto>selectWithUsersNameList();

  // id로 검색시 문의를 남긴 유저의 이름과 같이 반환(QuestionAdminListDto 타입객체)
  QuestionAdminListDto selectWithUsersNameOne(long id);
  
  // 문의 리스트 1. 미답변 우선, 2. 오래된 순서로 리스트 반환 
  List<QuestionAdminListDto> selectNoAnsweredFirst();
  
  // 업데이트
  int updateAnswere(Question entity);
}