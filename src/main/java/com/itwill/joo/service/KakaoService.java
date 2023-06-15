package com.itwill.joo.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.itwill.joo.domain.User;
import com.itwill.joo.dto.user.KakaoDto;
import com.itwill.joo.dto.user.UserCreateDto;
import com.itwill.joo.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class KakaoService {

	private final UserRepository userRepository;
	
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=106ceddf8917e2e7f047b10bfe41f185"); // 본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8081/joo/kakao"); // 본인이 설정해 놓은 경로
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode + "확인");

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result + "결과");

			JsonParser parser = new JsonParser();
			JsonObject element = (JsonObject) parser.parse(result);

			access_Token = element.get("access_token").toString();
			refresh_Token = element.get("refresh_token").toString();
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}

		return access_Token;
	}

	public KakaoDto getuserinfo(String access_Token) {

		HashMap<String, Object> userInfo = new HashMap<String, Object>();

		String requestURL = "https://kapi.kakao.com/v2/user/me";

		try {
			URL url = new URL(requestURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			// 키값, 속성 적용
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode :" + responseCode + "여긴가");
			BufferedReader buffer = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			while ((line = buffer.readLine()) != null) {
				result += line;
			}

			System.out.println("response body :" + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result); // Json element 문자열변경
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String kakaoId = generateKakaoUserId((String) userInfo.get("nickname"), (String) userInfo.get("email"));
		User user = userRepository.selectUserByLoginId(kakaoId);
		
		if(user != null) {
			return KakaoDto.fromEntity(user);
		}
		
		KakaoDto dto = KakaoDto.builder()
				.login_id(kakaoId)
				.uemail((String) userInfo.get("email"))
				.uname((String) userInfo.get("nickname"))
				.build();
		
		return dto;
	}
	
	public int createKakaoUser(UserCreateDto dto) {
		dto.setRole("ROLE_SOCIAL");
		return userRepository.createKakaoUser(dto.toEntity());
	}
	
	private String generateKakaoUserId(String nickname, String email) {
		return "kakao_" + email;
	}

}