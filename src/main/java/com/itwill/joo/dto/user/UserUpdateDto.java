package com.itwill.joo.dto.user;

import com.itwill.joo.domain.User;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class UserUpdateDto {
	
	private String name;
	private String phone;
	private String street;
	private String detailAddress;
	private String postcode;
	private String password;
	
	public User toEntity() {
		return User.builder()
				.uname(name)
				.uphone(phone)
				.ustreet(street)
				.udetail_address(detailAddress)
				.upostcode(postcode)
				.upassword(password)
				.build();
	}

}
