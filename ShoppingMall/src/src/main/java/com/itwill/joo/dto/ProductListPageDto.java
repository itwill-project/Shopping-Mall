package com.itwill.joo.dto;

import java.time.LocalDateTime;

import com.itwill.joo.domain.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor // 기본 생성자
@AllArgsConstructor // 필드전체 생성자
@Builder // 빌드패턴
/**
 * ProductListPageDto 클래스 작성
 * @author 김세엽
 *
 */
public class ProductListPageDto {
	
	// 상품 id
	private long p_id;
	
	// 상품정보1 (보여지는 정보)
	private String pname; // 이름
	private String ptitle_image; // 타이틀 이미지
	private String pdetail_image; // 타이틀 이미지
	private String pvoluem; // 용량
	private int pprice; // 판매 가격
	private int pstock; // 수량
	
	// 상품정보2 (검색에 필요한 정보)
	private String pregion; // 지역
	private String pcategory; // 카테고리
	private int palc; // 도수
	private int pdiscount; // 할인율
	
	// 상품정보3 (new/hot 상품 분류)
	private LocalDateTime pcreated_time; // 제품등록시간
	private LocalDateTime modified_time; // 제품등록시간
	private int psold; // 판매량
	
	public static ProductListPageDto fromEntity(Product entity) {
		
		return ProductListPageDto.builder().p_id(entity.getId())
				.pname(entity.getPname()).ptitle_image(entity.getPtitle_image())
				.pprice(entity.getPprice()).pstock(entity.getPstock()).pvoluem(entity.getPvolume())
				.pregion(entity.getPregion()).pcategory(entity.getPcategory())
				.palc(entity.getPalc()).pcreated_time(entity.getPcreated_Time().toLocalDateTime())
				.modified_time(entity.getPmodified_Time().toLocalDateTime()).psold(entity.getPsold()).build();
	}

	
}
