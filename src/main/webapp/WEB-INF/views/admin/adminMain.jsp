<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 부트스트랩 -->
		<title>JOO</title>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
			crossorigin="anonymous">
	</head>
	<body>
		<div>
			<h1>관리자 페이지</h1>
            <hr/>
                <select id="menu" class="form-select form-select-lg mb-3"
                    aria-label=".form-select-lg example">
                    <option selected>관리자 기능을 선택하시오</option>
                    <option value="product">상품관리</option>
                    <option value="user">유저관리</option>
                    <option value="quseries">문의관리</option>
                    <option value="review">리뷰관리</option>
                    <option value="post">게시글 관리</option>
                </select>

                <!-- 선택지에 따라서 하단에 리스트 표시 -->
                <!-- 클릭이 되었을때, 레스트컨트롤러로 해당 db에서 값을 읽어온다. -->
                <!-- div를 하나만 설정하고, 그 id를 받아서 해당값 innerhtml을 변경시킨다. -->

                <div id ="selectedContens"></div>

                <div id="product" class="d-none">
                상품관리 crud 전부가능


                <div>

                </div>


                </div>
                <div id="user" class="d-none">유저관리 rud 가능</div>
                <div id="quseries" class="d-none">문의관리 ru 가능</div>
                <div id="review" class="d-none">리뷰관리 rd 가능</div>
                <div id="post" class="d-none">게시글관리 crud 가능 크게 공지/이벤트(카테고리 설정)로 나눌예정</div>




            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
            <script src="../static/js/adminPage/adminPage.js"></script>
		</div>
	</body>
</html>