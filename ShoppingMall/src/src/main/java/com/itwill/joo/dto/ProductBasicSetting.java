package com.itwill.joo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductBasicSetting {

	private String pname;
	private String pcategory;
	private int pprice;
	private int palc;
	private String pregion;
	private int pstock;
	private String pvolume;
	private String pdiscount;
	
}
