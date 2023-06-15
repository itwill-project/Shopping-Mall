package com.itwill.joo.dto.question;

import com.itwill.joo.domain.Question;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // Getter, Setter, toString, equals, hashCode
@NoArgsConstructor // 기본 생성자
@AllArgsConstructor // 모든 필드를 아규먼트로 갖는 생성자
@Builder
public class QuestionCreateDto {

	private long u_id; // 사용자 아이디

	private long p_id; // 상품 아디

	private String qtitle; // 문의 제목
	private String qtype; // 문의 유형
	private String qcontent; // 문의 내용

	// QuestionCreateDto 타입의 객체를 Questions 타입의 객체로 변환해서 리턴.
	public Question toEntity() {
		// return new Question(0, u_id, qtitle, qtype, qcontent, null, null)
		return Question.builder().u_id(u_id).p_id(p_id).qtitle(qtitle).qtype(qtype).qcontent(qcontent).build();

	}

}