package com.itwill.joo.dto.question;

import java.sql.Timestamp;

import com.itwill.joo.domain.Question;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@AllArgsConstructor
@Builder
@Getter
@ToString
public class QuestionsListDto {

    private long id;
    private int is_answered;
    private String qtitle;
    private String qcontent;
    private long u_id;
    private Timestamp qcreated_time;

   // Question 타입의 객체를  QuestionsListDto 타입의 객체로 변환해서 리턴하는 메서드.
    public static QuestionsListDto fromEntity(Question entity) {
        return QuestionsListDto.builder()
        .id(entity.getId())
        .is_answered(entity.getIs_answered())
        .qtitle(entity.getQtitle())
        .qcontent(entity.getQcontent())
        .u_id(entity.getU_id())
        .qcreated_time(Timestamp.valueOf(entity.getQcreated_time()))
        .build();
    }

}