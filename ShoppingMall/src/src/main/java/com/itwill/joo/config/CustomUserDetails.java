package com.itwill.joo.config;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.itwill.joo.domain.User;

public class CustomUserDetails implements UserDetails {

	private static final long serialVersionUID = 1L;
	private User user;
	
	public CustomUserDetails(User user) {
		this.user = user;
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

}
