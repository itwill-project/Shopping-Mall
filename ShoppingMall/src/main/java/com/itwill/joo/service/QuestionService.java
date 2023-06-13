package com.itwill.joo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.joo.dto.question.QuestionDetailDto;
import com.itwill.joo.dto.question.QuestionUpdateDto;
import com.itwill.joo.domain.Product;
import com.itwill.joo.domain.Question;
import com.itwill.joo.domain.User;
import com.itwill.joo.dto.question.QuestionCreateDto;
import com.itwill.joo.dto.question.QuestionsListDto;
import com.itwill.joo.repository.ProductRepository;
import com.itwill.joo.repository.QuestionRepository;
import com.itwill.joo.repository.UserRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service // -> 스프링 컨테이너에서 서비스 컴포넌트 객체를 생성하고 관리(필요한 곳에 주입).
@RequiredArgsConstructor // 2. (2) final로 선언된 필드를 초기화하는 생성자를 자동으로 만들어줌.@Slf4j
@Slf4j
public class QuestionService {

    // 생성자에 의한 의존성 주입
    private final UserRepository userRepository;
    private final QuestionRepository questionRepository;
    private final ProductRepository productRepository;
    
    // 상품 Service
    
    // 상품 문의 목록
    public List<QuestionsListDto> readProductId(long p_id) {
        log.info("read()");
        
        
        
        List<Question> list = questionRepository.selectWhereTypeProduct(p_id);
        
        List<QuestionsListDto> questions = new ArrayList<>();
        
        for(Question q : list) {
            long userId = q.getU_id();
            long productId = q.getP_id();
            User user = userRepository.selectUserById(userId);
            Product product = productRepository.selectProductById(productId);
            String login_id =   user. getLogin_id();
        
            QuestionsListDto dto = QuestionsListDto.fromEntity(q);
            dto.setLogin_id(login_id);
            dto.setProduct(product);
            questions.add(dto);
            
        }
        
//        return list.stream().map(QuestionsListDto::fromEntity).toList();
        return questions;
    }
    
    // 상품 문의 상세보기
    public QuestionDetailDto read(long id) {
        log.info("read(id)");
        
        Question entity = questionRepository.selectById(id);
        
        return QuestionDetailDto.fromEntity(entity);
    }
    
    // 상품 문의 작성
    public int create(QuestionCreateDto dto) {
        log.info("create(question)", dto);
        
        return questionRepository.insert(dto.toEntity());
    }

    // 상품 문의 수정
    public int update(QuestionUpdateDto dto) {
        log.info("update(question)", dto);
        
        return questionRepository.updateTitleAndContent(dto.toEntity());
    }
    
    // 상품 문의 삭제
    public int delete(long id) {
        log.info("delete(id)", id);
        
        return questionRepository.deleteById(id);
        
    }
    
    
    
    // QNA service
    
    // Qna 목록
    public List<QuestionsListDto> readQna() {
        log.info("read()");
    
        List<Question> list = questionRepository.selectWhereTypeQnA();
        
        return list.stream().map(QuestionsListDto::fromEntity).toList();
    }
    
    //  고객 문의 상세보기
    public QuestionDetailDto readQna(long id) {
        log.info("read(id)");
        
        Question entity = questionRepository.selectById(id);
        
        return QuestionDetailDto.fromEntity(entity);
    }
  
    
    // 고객 문의 작성
    public int createQna(QuestionCreateDto dto) {
        log.info("createQna(question)", dto);
        
        return questionRepository.insert(dto.toEntity());
    }
    
    // 고객 문의 수정
    public int updateQna(QuestionUpdateDto dto) {
        log.info("updateQna(question)", dto);
        
        return questionRepository.updateTitleAndContent(dto.toEntity());
    }
    
    // 고객 문의 삭제
    public int deleteQna(long id) {
        log.info("deleteQna(id)", id);
        
        return questionRepository.deleteById(id);
        
    }
    
    
}
