package com.itwill.joo.dto;

import com.itwill.joo.domain.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductUpdateDto {

	private long p_id;
	private String pname;
	private int pprice;
	private int pdiscount;
	private int pstock;
	
	public Product toEntity() {
	
		return Product.builder().id(p_id).pname(pname)
				.pprice(pprice).pdiscount(pdiscount)
				.pstock(pstock).build();
	}
	
}
