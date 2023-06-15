package com.itwill.joo.config;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.itwill.joo.domain.User;

public class CustomUserDetails implements UserDetails, OAuth2User {

	private static final long serialVersionUID = 1L;
	private User user;
	private Map<String, Object> attributes;
	
	// 일반 로그인 시
	public CustomUserDetails(User user) {
		this.user = user;
	}
	
	// OAuth2 로그인
	public CustomUserDetails(User user, Map<String, Object> attributes) {
		this.user = user;
		this.attributes = attributes;
	}
	
	public User getUser() {
		return user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(()->{ return user.getRole();});
        return authorities;
	}

	@Override
	public String getPassword() {
		return user.getUpassword();
	}

	@Override
	public String getUsername() {
		return user.getLogin_id();
	}

	@Override
	public boolean isAccountNonExpired() {
		 return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		 return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		 return true;
	}

	@Override
	public boolean isEnabled() {
		 return true;
	}

	@Override
	public String getName() {
		return user.getLogin_id();
	}

	@Override
	public Map<String, Object> getAttributes() {
		return attributes;
	}

}
