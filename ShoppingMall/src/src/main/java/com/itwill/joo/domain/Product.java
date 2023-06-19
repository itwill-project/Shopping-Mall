package com.itwill.joo.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
/**
 * Product 클래스 작성
 * @author 서원준/김세엽
 *
 */
public class Product {
	
	private long id; // (PK값)
	
	private String pname; // 상품 이름
	private String pcategory; // 상품 카테고리 (소주, 맥주, 와인, 전통주, 기타로 총 5가지 분류)
	private String pregion; // 상품 원산지 (서울, 경기, 인천, 강원, 충청, 전라, 경상, 제주, 기타로 총 9가지로 분류)
	private String ptitle_image; // 상품 타이틀 이미지 경로 (기본값 노이미지)
	private String pdetail_image; // 상품 상세 이미지 경로 (기본값 노이미지)
	
	private int palc; // 상품 도수 
	private int psold; // 상품 판매량 (기본값: 0)
	
	private Timestamp pcreated_Time; // 상품 등록일자 (기본값: systimestamp)
	private Timestamp pmodified_Time; // 상품 수정일자 (기본값: systimestamp)

	private String pvolume; // 상품 용량
	private int pdiscount; // 상품 할인률
	private int pprice; // 상품 가격
	private int pstock; // 상품 수량
	
}
