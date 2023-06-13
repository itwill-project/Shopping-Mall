package com.itwill.joo.repository;

import org.apache.ibatis.annotations.Param;

import com.itwill.joo.domain.User;

public interface UserRepository {
	
	User selectUserByEmail(String email);
	
	User selectUserByLoginId(String login_id);
	
	String findLoginIdByEmailAndName(@Param("name") String name, @Param("email") String email);

	int createUser(User user);
	
	int createKakaoUser(User user);
	
	int updatePassword(String password, long id);
	
	
	// 상품문의에서 필요
	 User selectUserById(long id);

}
