package com.itwill.joo.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
/**
 * Delivery 클래스 작성
 * @author 김우현
 *
 */
public class Delivery {
	
	private long id;
	private long o_id; // 주문 아이디
	
	private String dcode; // 송장 번호
	private String rname; // 수령인 이름
	private String rphone; // 수령인 전화번호
	private String dmessage; // 배송 메세지
	
	// 배송 받을 주소
	private String dstreet; // 도로명주소
	private String ddetail_address; // 상세주소
	private String dpostcode; // 우편번호
	
	private int dprice; // 배송비
	private int dtype; // 배송 타입
	
	private String dstatus; // 배송 상태
	
	private LocalDateTime dcreated_time; // 배송 시작일자
	private LocalDateTime dmodified_time; // 배송 상태 변경일자

}
