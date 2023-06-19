package com.itwill.joo.dto;

import java.time.LocalDateTime;

import com.itwill.joo.domain.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor 
@AllArgsConstructor
@Builder 
// 제품 생성 DTO
public class ProductCreateDto {

	private long id;
	private String pname; // 제품이름
	private String pcategory; // 제품카테고리
	private String pregion; // 원산지
	private String pvolume; // 용량
	private int pprice; // 가격
	private int palc; // 도수
	private int pstock; // 제고수
	private int pdiscount; // 할인
	
	// 저장경로
	private String ptitle_image; // 섬네일
	private String pdetail_image; // 상세보기
	
	private LocalDateTime pcreated_time;
	private LocalDateTime pmodified_time;
	
	public Product toEntity() {
		return Product.builder().id(id).pname(pname).pcategory(pcategory).pregion(pregion).pvolume(pvolume)
				.pprice(pprice).palc(palc).pstock(pstock).ptitle_image(ptitle_image).pdetail_image(pdetail_image).build();
	}
	
	public static ProductCreateDto fromEntity(Product p) {
		return ProductCreateDto.builder().id(p.getId()).pname(p.getPname())
				.pcategory(p.getPcategory()).pregion(p.getPregion())
				.pvolume(p.getPvolume()).pprice(p.getPprice())
				.palc(p.getPalc()).pstock(p.getPstock())
				.pdiscount(p.getPdiscount()).ptitle_image(p.getPtitle_image())
				.pdetail_image(p.getPdetail_image()).pcreated_time(p.getPcreated_Time().toLocalDateTime())
				.pmodified_time(p.getPmodified_Time().toLocalDateTime()).build();
	}
	
}
