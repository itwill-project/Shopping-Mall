package com.itwill.joo.dto.question;

import java.sql.Timestamp;

import com.itwill.joo.domain.Product;
import com.itwill.joo.domain.Question;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Builder
@Getter
@ToString
@Setter
public class QuestionDetailDto {

    private long id;
    private long u_id;
    private long p_id;
    private String is_answered;
    private String qtitle;
    private String qcontent;
    
    private String login_id;
    private Product product;
    
    private String qtype;
    private Timestamp qcreated_time;
    private Timestamp qmodified_time;
   
    
    //Question 타입의 객체를 QuestionDetailDto 타입의 객체로 변환해서 리턴하는 메서드
    public static QuestionDetailDto fromEntity(Question entity) {
        return QuestionDetailDto.builder()
                .id(entity.getId())
                .u_id(entity.getU_id())
                .p_id(entity.getP_id())
                .is_answered(entity.getIs_answered())
                .qtitle(entity.getQtitle())
                .qcontent(entity.getQcontent())
                .qtype(entity.getQtype())
                .qcreated_time(Timestamp.valueOf(entity.getQcreated_time()))
                .qmodified_time(Timestamp.valueOf(entity.getQmodified_time()))
                .build();
    }
    
}
