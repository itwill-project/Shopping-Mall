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
@Setter
@ToString
public class QuestionsListDto {

    private long id;
    private String is_answered;
    private String qtitle;
    private String qcontent;
    
    // 삭제 예정
    private String qtype;

    // user테이블에서 필요한 값을 불러오기 위함
    private long u_id;
    private String login_id;
   
    // Products테이블에서는 가져올 값이 많이 있기때문에 Product 타입으로 선언
    private  Product product;
    
    private Timestamp qcreated_time;

   // Question 타입의 객체를  QuestionsListDto 타입의 객체로 변환해서 리턴하는 메서드.
    public static QuestionsListDto fromEntity(Question entity) {
        return QuestionsListDto.builder()
        .id(entity.getId())
        .is_answered(entity.getIs_answered())
        .qtype(entity.getQtype())
        .qtitle(entity.getQtitle())
        .qcontent(entity.getQcontent())
        .u_id(entity.getU_id())
        .qcreated_time(Timestamp.valueOf(entity.getQcreated_time()))
        .build();
    }

}