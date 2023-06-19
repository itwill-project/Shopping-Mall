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
public class AdminProductPageDto {
	
	private long p_id;
	private String pname;
	private int pprice;
	private int palc;
	private String pregion;
	private LocalDateTime pcreadted_time;
	private LocalDateTime pmodified_time;
	private String pvoluem;
	private int pstock;
	private int psold;
	
	public static AdminProductPageDto fromEntity(Product p) {
		return AdminProductPageDto.builder().p_id(p.getId()).pname(p.getPname())
				.pprice(p.getPprice()).palc(p.getPalc())
				.pregion(p.getPregion())
				.pcreadted_time(p.getPcreated_Time().toLocalDateTime())
				.pmodified_time(p.getPmodified_Time().toLocalDateTime())
				.pvoluem(p.getPvolume()).pstock(p.getPstock()).psold(p.getPsold()).build();
	}

}
