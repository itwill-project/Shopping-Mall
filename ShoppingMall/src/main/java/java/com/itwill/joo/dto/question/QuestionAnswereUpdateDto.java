package com.itwill.joo.dto.question;

import com.itwill.joo.domain.Question;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QuestionAnswereUpdateDto {
	
	private long q_id;
	private String is_answered;
	
	public Question toEntity() {
		return Question.builder().id(q_id).is_answered(is_answered).build();
	}

}
