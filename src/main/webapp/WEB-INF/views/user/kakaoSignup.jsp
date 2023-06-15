<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>카카오 페이지</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
		crossorigin="anonymous">
	<style>
		input[type=button] {
			width: 120px;
		}
	</style>
</head>
<body>
	<div style="width: 60%; margin: 0 auto;">
		<h1>회원가입</h1>
		<hr/>
		<form id="join-form">
		  <div class="row mb-3">
		    <label for="loginId" class="col-sm-2 col-form-label">아이디</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="loginId" name="loginId" value=${ loginId } readonly>
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="name" class="col-sm-2 col-form-label">이름</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="name" name="name" value=${ name } readonly>
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="phone" class="col-sm-2 col-form-label">전화번호</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="phone" name="phone">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="email" class="col-sm-2 col-form-label">이메일</label>
		    <div class="col-sm-10">
		      <input type="email" class="form-control" id="email" name="email" value=${ email } readonly>
		    </div>
		  </div>
		  
		  <span id="guide" style="color:#999;display:none"></span>
		  <div class="row mb-3">
		    <label for="postcode" class="col-sm-2 col-form-label">주소</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="postcode" name="postcode">
		    </div>
		    <div class="col-sm-2 text-center">
		    	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-outline-primary">
		    </div>
		  </div>
		   <div class="row mb-3">
		    <label for="street" class="col-sm-2 col-form-label"></label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="street" name="street">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="detailAddress" class="col-sm-2 col-form-label"></label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="detailAddress" name="detailAddress">
		    </div>
		  </div>
		  
		  <button type="submit" id="joinBtn" class="btn btn-outline-success">가입</button>
		  <a href="/joo" class="btn btn-outline-danger">취소</a>
		</form>	
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="../static/js/userPage/kakao-create.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("street").value = roadAddr;
	
	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>