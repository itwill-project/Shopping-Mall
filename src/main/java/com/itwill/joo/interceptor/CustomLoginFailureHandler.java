package com.itwill.joo.interceptor;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		String username = request.getParameter("login_id");
		String password = request.getParameter("upassword");
		String errorMessage = null;
		
		log.info("username = {}, password = {}", username, password);
		
		if(exception instanceof BadCredentialsException || exception instanceof InternalAuthenticationServiceException) {
			errorMessage = "아이디나 비밀번호를 다시 확인해주세요.";
		} else if(exception instanceof DisabledException) {
			errorMessage = "계정이 비활성화 되었습니다. 관리자에게 문의하세요.";
		} else if(exception instanceof CredentialsExpiredException) {
			errorMessage = "비밀번호 유호기간이 만료되었습니다. 관리자에게 문의하세요.";
		} else {
			errorMessage = "알 수 없는 이유로 로그인에 실패했습니다. 관리자에게 문의하세요.";
		}
		
		request.setAttribute("login_id", username);
		request.setAttribute("upassword", password);
		request.setAttribute("errorMessage", errorMessage);
		
		log.info("errorMessage = {}", errorMessage);
		
		response.sendRedirect("/joo/user/login?errorMessage=" + URLEncoder.encode(errorMessage, "UTF-8"));
	}

}
