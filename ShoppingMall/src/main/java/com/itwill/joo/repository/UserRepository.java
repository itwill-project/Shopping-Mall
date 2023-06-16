package com.itwill.joo.repository;

import org.apache.ibatis.annotations.Param;

import com.itwill.joo.domain.User;

public interface UserRepository {
	
	User selectUserByEmail(String email);
	
	User selectUserByLoginId(String login_id);
	
	String findLoginIdByEmailAndName(@Param("name") String name, @Param("email") String email);

	int createUser(User user);
	
	int createKakaoUser(User user);
	
	int updateUser(User user);
	
	int updatePassword(@Param("loginId") String loginId, @Param("password") String password);
	
	int deleteUserById(long id);

}
