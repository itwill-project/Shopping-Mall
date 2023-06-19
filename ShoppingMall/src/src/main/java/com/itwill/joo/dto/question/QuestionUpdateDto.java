package com.itwill.joo.dto.question;

import com.itwill.joo.domain.Question;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class QuestionUpdateDto {

    private long id;
    private String qtitle;
    private String qcontent;
    
    // PostUpdateDto 객체를 Post 타입 객체로 변환
    public Question toEntity() {
        return Question.builder()
                .id(id)
                .qtitle(qtitle)
                .qcontent(qcontent)
                .build();
    }
    
}
