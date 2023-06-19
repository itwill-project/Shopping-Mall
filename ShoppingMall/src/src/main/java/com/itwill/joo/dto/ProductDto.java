package com.itwill.joo.dto;

import com.itwill.joo.domain.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductDto {
	
	private long id;
	
	private String pname;
	private String pvolume;
	private int pprice;
	
	private String ptitle_Iamge;
	private String pdetail_Iamge;

	public static ProductDto fromEntity(Product p){
		return ProductDto.builder().id(p.getId()).pname(p.getPname()).pvolume(p.getPvolume()).pprice(p.getPprice())
		.ptitle_Iamge(p.getPtitle_image()).pdetail_Iamge(p.getPdetail_image()).build();
		
	}

}
