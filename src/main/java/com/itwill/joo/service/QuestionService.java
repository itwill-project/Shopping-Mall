package com.itwill.joo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.joo.domain.Question;
import com.itwill.joo.dto.question.QuestionCreateDto;
import com.itwill.joo.dto.question.QuestionsListDto;
import com.itwill.joo.repository.QuestionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service // -> 스프링 컨테이너에서 서비스 컴포넌트 객체를 생성하고 관리(필요한 곳에 주입).
@RequiredArgsConstructor // 2. (2) final로 선언된 필드를 초기화하는 생성자를 자동으로 만들어줌.@Slf4j
@Slf4j
public class QuestionService {

    // 생성자에 의한 의존성 주입
    private final QuestionRepository questionRepository;

    // 문의사항 목록 페이지
    public List<QuestionsListDto> read() {
        log.info("read()");

        List<Question> list = questionRepository.selectOrderByDesc();       

        return list.stream().map(QuestionsListDto::fromEntity).toList();
    }

    // 문의사항 상세보기
    public Question read(long id) {
        log.info("read(id={}", id);

        return questionRepository.selectById(id);
    }

    //새 문의사항 작성 페이지
   public int questionCreate(QuestionCreateDto dto) {
       log.info("questionCreate({})", dto);

       return questionRepository.insert(dto.toEntity());
   }

}