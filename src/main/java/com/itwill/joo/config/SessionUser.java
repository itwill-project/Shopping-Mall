package com.itwill.joo.config;

import com.itwill.joo.domain.User;

import lombok.Getter;

@Getter
public class SessionUser {
	
	private String name;
	private String email;
	private String profile_yn;
	
	public SessionUser(User user) {
        this.name = user.getUname();
        this.email = user.getUemail();
	}

}
