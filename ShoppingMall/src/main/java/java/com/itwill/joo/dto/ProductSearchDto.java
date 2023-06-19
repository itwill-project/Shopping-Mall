package com.itwill.joo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ProductSearchDto {

	private String searchWord;
	private String pregion1;
	private String pregion2;
	private String pregion3;
	private String pregion4;
	private String pregion5;
	private String pregion6;
	private String pregion7;
	private String pregion8;
	private String pcategory1;
	private String pcategory2;
	private String pcategory3;
	private String pcategory4;
	private String pcategory5;
	private int palc_min;
	private int palc_max;

	
}
