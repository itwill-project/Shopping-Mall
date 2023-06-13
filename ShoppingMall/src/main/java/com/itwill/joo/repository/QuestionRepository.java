package com.itwill.joo.repository;

import java.util.List;

import com.itwill.joo.domain.Question;

//application-context.xml에서 scan하는 패키지에 있기 때문에
//인터페이스를 구현하는 클래스가 MyBatis에 의해서 자동으로 만들어짐.
//question-mapper.xml 파일에서 설정된 id와 메서드 이름이 같으면
//해당 아이디의 SQL 문장을 실행하는 구현 메서드를 만들어줌.
public interface QuestionRepository {

  // 상품문의
  int insert(Question question);
  List<Question> selectOrderByDesc();
  Question selectById(long id);
  int updateTitleAndContent(Question question);
  int deleteById(long id);
  
  // QnA
  List<Question> selectWhereTypeProduct(long p_id);
  List<Question> selectWhereTypeQnA();
  
  
}