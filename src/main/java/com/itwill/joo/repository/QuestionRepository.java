package com.itwill.joo.repository;

import java.util.List;

import com.itwill.joo.domain.Question;

public interface QuestionRepository {

    int insert(Question question);
    List<Question> selectOrderByDesc();
    Question selectById(long id); 

}