package com.itwill.joo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum;
	private int amount;
	private String btype;
	
	private String category; // 분류
	private String keyword;
	
	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public Criteria(int pageNum, int amount, String btype) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.btype = btype;
	}
	
	public String[] getTypeArr() {
		return category == null ? new String[] {} : category.split("");
	}

}
