<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Index Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
    rel="stylesheet" 
    integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" 
    crossorigin="anonymous">
</head>
<body>
		<div>
            <header class="my-1 p-3 text-bg-dark">
            <div>
                <nav class="navbar navbar-expand-lg bg-secondary">
                    <div class="container-fluid">
                        <!-- 홈과 로고클릭시 메인페이지로 이동 -->
                        <a class="navbar-brand" href="/joo/">로고</a>
                        <button class="navbar-toggler" type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent"
                            aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse"
                            id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item"><a
                                    class="nav-link active"
                                    aria-current="page" href="/joo/">Home</a>
                                </li>

                               <sec:authorize access="isAnonymous()">
                                <li class="nav-item"><a
                                    class="nav-link" href="/joo/user/login">로그인</a></li>
                                    
                                <li class="nav-item"><a
                                    class="nav-link" href="/joo/user/join">회원가입</a></li>
                                </sec:authorize>
                                
                                <sec:authorize access="isAuthenticated()">
                                	<li class="nav-item"><a
                                    	class="nav-link" href="/joo/user/logout">로그아웃</a></li>

                                <li class="nav-item dropdown"><a
                                    class="nav-link dropdown-toggle"
                                    href="#" role="button"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"> 마이페이지
                                </a>
                                    <ul class="dropdown-menu">
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myDetails">개인정보 수정</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myGrade">적립금 확인</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myOrder">주문 내역</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myQuseries">문의 내역</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myBasket">장바구니</a></li>

                                    </ul>
                                    </li>
                                <!-- 최근본 상품은 모달로 처리 -->
                                <li class="nav-item"><a class="nav-link" href="">최근본상품</a></li>
                                <li class="nav-item"><a class="nav-link" href="">문의하기</a></li>
                                </sec:authorize>
                            </ul>
                            <!-- 검색 페이지 -->
                            <form class="d-flex" role="search" action="/joo/product/productsList">
                                <input class="form-control me-2"
                                    type="search" placeholder="제품 검색"
                                    aria-label="Search" id="searchText">
                                <button class="btn btn-outline-success" type="submit">search</button>
                            </form>
                        </div>
                    </div>
                </nav>  
            </div>
			<h3 class="text-center">해더</h3>
            </header>
            <!-- 카테고리 네비 -->
            <ul class="nav nav-tabs">

                <li class="nav-item dropdown"><a
                    class="nav-link dropdown-toggle"
                    data-bs-toggle="dropdown" href="#" role="button"
                    aria-expanded="false">카테고리</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/joo/product/productsList">모아보기</a></li>
                        <li><a class="dropdown-item" href="/joo/product/productsList">소주</a></li>
                        <li><a class="dropdown-item" href="/joo/product/productsList">맥주</a></li>
                        <li><a class="dropdown-item" href="/joo/product/productsList">와인</a></li>
                        <li><a class="dropdown-item" href="/joo/product/productsList">양주</a></li>
                    </ul></li>
                <li class="nav-item"><a class="nav-link" href="/joo/product/productsNewList">신상</a>
                </li>
                <li class="nav-item"><a class="nav-link" href="/joo/product/productsHotList">랭킹</a></li>
                <li class="nav-item"><a class="nav-link" href="/joo/post/postList">공지사항/이벤트</a></li>
            </ul>

            <main  class="my-1 p-5 text-bg-dark">
                <!-- 공지글 상세보기 -->
                <h1 class="text-center">
                    바디(메인베너)
                </h1>

                <!-- 반복문으로 이벤트 자동으로 만들기 -->
                <div id="carouselExampleIndicators" class="carousel slide"
                    data-b  s-ride="true">
                    <div class="carousel-indicators">
                        <button type="button"
                            data-bs-target="#carouselExampleIndicators"
                            data-bs-slide-to="0" class="active"
                            aria-current="true" aria-label="Slide 1"></button>
                        <button type="button"
                            data-bs-target="#carouselExampleIndicators"
                            data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button"
                            data-bs-target="#carouselExampleIndicators"
                            data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                        <a href="/joo/post/postDetail">
                            <img src="./static/assets/bannerImages/001.jpg" class="d-block w-100" alt="bannerImege01">
                        </a>
                        </div>
                        <div class="carousel-item">
                        <a href="/joo/post/postDetail">
                            <img src="./static/assets/bannerImages/002.jpg" class="d-block w-100" alt="bannerImege02">
                        </a>
                        </div>
                        <div class="carousel-item">
                        <a href="/joo/post/postDetail">
                            <img src="./static/assets/bannerImages/003.jpg" class="d-block w-100" alt="bannerImege03">
                        </a>
                        </div>
                    </div>
                <button class="carousel-control-prev" type="button"
                    data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon"
                        aria-hidden="true"></span> <span
                        class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button"
                    data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon"
                        aria-hidden="true"></span> <span
                        class="visually-hidden">Next</span>
                </button>
            </div>

        </main>
        <footer class="my-1 p-3 text-bg-dark">
            <!-- 기업정보, 홈 인스타, 페이스북, 등등 필한거 -->
            <h1 class="text-center">풋터</h1>

            <a href="">home</a>
        </footer>

			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
		</div>
	</body>
</html>
