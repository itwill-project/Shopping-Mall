package com.itwill.joo.dto.order;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderedProductDto {

	private long id;

	private String pdetail_image; // 상품 이미지
	private String pname; // 상품 이름
	private int pprice; // 상품 가격
	private int pstock; // 상품 수량

//	public Product toEntity() {
//		return Product.builder()
//				.login_id(loginId)
//				.upassword(password)
//				.uname(name)
//				.uemail(email)
//				.uphone(phone)
//				.ustreet(street)
//				.udetail_address(detailAddress)
//				.upostcode(postcode)
//				.role("ROLE_USER")
//				.build();
//	}

}