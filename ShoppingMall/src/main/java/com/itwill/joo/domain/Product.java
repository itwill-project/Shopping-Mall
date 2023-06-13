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
public class Product {
	
	private long id;
	
	private String pname; // 상품 이름
	private String pcategory; // 상품 카테고리
	private String pregion; // 상품 원산지
	private String ptitle_image; // 상품 타이틀 이미지 경로
	private String pdetail_image; // 상품 상세 이미지 경로
	
	private int palc; // 상품 도수
	private int psold; // 상품 판매량 (기본값: 0)
	private String pvolume;
	private int pprice;
	private int pstock;
	private int pdiscount;
	
	private LocalDateTime pcreated_time; // 상품 등록일자
	private LocalDateTime pmodified_time; // 상품 수정일자

}
