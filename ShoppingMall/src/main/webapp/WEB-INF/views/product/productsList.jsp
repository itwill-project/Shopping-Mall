<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 부트스트랩 -->
		<title>joo</title>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
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
                                
                                <!-- TODO : 로그인 회원가입 링크로 이동(로그인상태일때 비가시화) -->
                                <li class="nav-item"><a
                                    class="nav-link" href="/joo/user/sign">로그인/회원가입</a></li>
                                    
                                <li class="nav-item dropdown"><a
                                    class="nav-link dropdown-toggle"
                                    href="#" role="button"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"> 마이페이지
                                </a>
                                    <ul class="dropdown-menu">
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myPrivate">개인정보 수정</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myGrade">적립금 확인</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myOrder">주문 내역</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/question/questionsList">문의 내역</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myBasket">장바구니</a></li>
                                        
                                    </ul>
                                    </li>
                                <!-- 최근본 상품은 모달로 처리 -->
                                <li class="nav-item"><a class="nav-link" href="">최근본상품</a></li>
                                <li class="nav-item"><a class="nav-link" href="">문의하기</a></li>
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

            <!-- 검색 기능 -->
            <form action="/joo/product/productsList">
                <div class="input-group mb-3">

                    <span class="input-group-text">joo</span>
                    <div class="form-floating">
                        <input type="text" class="form-control"
                            id="floatingInputGroup1"
                            placeholder="search" /> <label
                            for="floatingInputGroup1">제품이름/술종류/도수로
                            검색</label>
                    </div>

                    <input type="submit" class="btn btn-outline-primary"
                        value="검색" />

                    <button class="btn btn-primary" type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#collapseExample"
                        aria-expanded="false"
                        aria-controls="collapseExample">상세검색</button>


                </div>
                <div class="collapse" id="collapseExample">
                    <div class="card card-body">

                        <div class="container text-center">
                            <div class="row" style="color: black;">
                                <!-- 1열 -->
                                <!-- 지역 -->
                                <div
                                    class="col order-first col-3 bg-light p-3 border">
                                    <div>지역검색</div>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input"
                                            type="checkbox"
                                            role="switch"
                                            id="flexSwitchCheckChecked"
                                            checked> <label
                                            class="form-check-label"
                                            for="flexSwitchCheckChecked"
                                            style="color: black;">전체지역</label>
                                    </div>
                                    <span class="form-check"> <input
                                        class="form-check-input"
                                        type="checkbox" value=""
                                        id="defaultCheck1"> <label
                                        class="form-check-label"
                                        for="defaultCheck1"
                                        style="color: black;">서울</label>
                                    </span> <span class="form-check"> <input
                                        class="form-check-input"
                                        type="checkbox" value=""
                                        id="defaultCheck2"> <label
                                        class="form-check-label"
                                        for="defaultCheck1"
                                        style="color: black;">경기</label>
                                    </span>
                                    <div class="form-check">
                                        <input class="form-check-input"
                                            type="checkbox" value=""
                                            id="defaultCheck3">
                                        <label class="form-check-label"
                                            for="defaultCheck1"
                                            style="color: black;">인천</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input"
                                            type="checkbox" value=""
                                            id="defaultCheck4">
                                        <label class="form-check-label"
                                            for="defaultCheck1"
                                            style="color: black;">강원</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input"
                                            type="checkbox" value=""
                                            id="defaultCheck5">
                                        <label class="form-check-label"
                                            for="defaultCheck1"
                                            style="color: black;">충청</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input"
                                            type="checkbox" value=""
                                            id="defaultCheck6">
                                        <label class="form-check-label"
                                            for="defaultCheck1"
                                            style="color: black;">전라</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input"
                                            type="checkbox" value=""
                                            id="defaultCheck7">
                                        <label class="form-check-label"
                                            for="defaultCheck1"
                                            style="color: black;">경상</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input"
                                            type="checkbox" value=""
                                            id="defaultCheck8">
                                        <label class="form-check-label"
                                            for="defaultCheck1"
                                            style="color: black;">제주</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input"
                                            type="checkbox" value=""
                                            id="defaultCheck9">
                                        <label class="form-check-label"
                                            for="defaultCheck1"
                                            style="color: black;">기타</label>
                                    </div>
                                </div>

                                <!-- 2열 -->
                                <div
                                    class="col order-last col-sm-9 bg-light p-1 border row row-cols-2"
                                    style="color: white;">
                                    <!-- 1행 -->
                                    <div
                                        class="col-sm-12 bg-dark p-3 border">
                                        <label for="customRange3"
                                            class="form-label">도수검색</label>
                                        <input type="range"
                                            class="form-range" min="0"
                                            max="5" step="0.5"
                                            id="customRange3">
                                        <div>
                                            (무알콜)--------------------(10+)--------------------(20+)--------------------(30+)--------------------(40+)--------------------(50+)
                                        </div>
                                    </div>
                                    <!-- 2행 -->
                                    <div
                                        class="col-sm-12 bg-dark p-3 border">
                                        <div>카테고리 검색</div>
                                        <div class="btn-group"
                                            role="group"
                                            aria-label="Basic checkbox toggle button group">

                                            <input type="checkbox"
                                                class="btn-check"
                                                id="btncheck1"
                                                autocomplete="off">
                                            <label
                                                class="btn btn-outline-primary"
                                                for="btncheck1">전통주</label>

                                            <input type="checkbox"
                                                class="btn-check"
                                                id="btncheck2"
                                                autocomplete="off">
                                            <label
                                                class="btn btn-outline-primary"
                                                for="btncheck2">소주</label>

                                            <input type="checkbox"
                                                class="btn-check"
                                                id="btncheck3"
                                                autocomplete="off">
                                            <label
                                                class="btn btn-outline-primary"
                                                for="btncheck3">맥주</label>

                                            <input type="checkbox"
                                                class="btn-check"
                                                id="btncheck4"
                                                autocomplete="off">
                                            <label
                                                class="btn btn-outline-primary"
                                                for="btncheck4">와인</label>

                                            <input type="checkbox"
                                                class="btn-check"
                                                id="btncheck5"
                                                autocomplete="off">
                                            <label
                                                class="btn btn-outline-primary"
                                                for="btncheck5">기타</label>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </form>




            <!-- 상품리스트 반복문을 통해 표시(관리자페이지에서 추가하면 자동으로 뒷열에 추가) -->
            <!-- 한페이지당 15개 보이기 -->
            <!-- 핫,뉴 표시 이미지로 만들어서 해당 상품별 시간대, 판매량을 검색한 후, 상단에 표시 -->
            <hr/>
                <div class="row row-cols-1 row-cols-md-5 g-4">
                
                    <div class="col">
                        <div class="card my-3 p-3" style="width: 18rem; cursor:pointer;" OnClick="location.href ='https://wonsoju.com/product/detail.html?product_no=27&cate_no=43&display_group=1'">
                            <img src="../static/assets/productImages/001.png" class="card-img-top" alt="oneProduct">
                            <div class="card-body">
                                <h5 class="card-title">1번 상품제목</h5>
                                <p class="card-text"><del>10000원</del></p>
                                <p class="card-text">8800원</p>
                                <p class="card-text">재고수 : 1200개</p>
                                <a href="https://wonsoju.com/product/detail.html?product_no=27&cate_no=43&display_group=1" class="btn btn-outline-primary col-12 mx-auto">order now</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col">
                        <div class="card my-3 p-3" style="width: 18rem; cursor:pointer;" OnClick="location.href ='/joo/product/productDetail'">
                            <img src="../static/assets/productImages/002.png" class="card-img-top" alt="twoProduct">
                            <div class="card-body">
                                <h5 class="card-title">2번 상품제목</h5> 
                                <p class="card-text"><del>10000원</del></p>
                                <p class="card-text">8800원</p>
                                <p class="card-text">재고수 : 1200개</p>
                                <a href="/joo/product/productDetail" class="btn btn-outline-primary col-12 mx-auto">order now</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col">
                        <div class="card my-3 p-3" style="width: 18rem; cursor:pointer;" OnClick="location.href ='/joo/product/productDetail'">
                            <img src="../static/assets/productImages/003.png" class="card-img-top" alt="threeProduct">
                            <div class="card-body">
                                <h5 class="card-title">3번 상품제목</h5>
                                <p class="card-text"><del>10000원</del></p>
                                <p class="card-text">8800원</p>
                                <p class="card-text">재고수 : 1200개</p>
                                
                                <a href="/joo/product/productDetail" class="btn btn-outline-primary col-12 mx-auto">order now</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col">
                        <div class="card my-3 p-3" style="width: 18rem; cursor:pointer;" OnClick="location.href ='/joo/product/productDetail'">
                            <a href="/joo/product/productDetail">
                            <img src="../static/assets/productImages/004.png" class="card-img-top" alt="fourProduct">
                            </a>
                            <div class="card-body">
                                <h5 class="card-title">4번 상품제목</h5>
                                <p class="card-text"><del>10000원</del></p>
                                <p class="card-text">8800원</p>
                                <p class="card-text">재고수 : 1200개</p>
                                <a href="/joo/product/productDetail" class="btn btn-outline-primary col-12 mx-auto">order now</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col">
                        <div class="card my-3 p-3" style="width: 18rem; cursor:pointer;" OnClick="location.href ='/joo/product/productDetail'">
                            <img src="../static/assets/productImages/005.png" class="card-img-top" alt="fiveProduct">
                            <div class="card-body">
                                <h5 class="card-title">5번 상품제목</h5>
                                <p class="card-text"><del>10000원</del></p>
                                <p class="card-text">8800원</p>
                                <p class="card-text">재고수 : 1200개</p>
                                <a href="/joo/product/productDetail" class="btn btn-outline-primary col-12 mx-auto">order now</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col">
                        <div class="card my-3 p-3" style="width: 18rem; cursor:pointer;" OnClick="location.href ='/joo/product/productDetail'">
                            <img src="../static/assets/productImages/006.png" class="card-img-top" alt="sixProduct">
                            <div class="card-body">
                                <h5 class="card-title">6번 상품제목</h5>
                                <p class="card-text"><del>10000원</del></p>
                                <p class="card-text">8800원</p>
                                <p class="card-text">재고수 : 0개</p>
                                <a href="/joo/product/productDetail" class="btn btn-outline-danger col-12 mx-auto">sold out</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col">
                        <div class="card my-3 p-3" style="width: 18rem; cursor:pointer;" OnClick="location.href ='/joo/product/productDetail'">
                            <img src="../static/assets/productImages/007.png" class="card-img-top" alt="sevenProduct">
                            <div class="card-body">
                                <h5 class="card-title">7번 상품제목</h5>
                                <p class="card-text"><del>10000원</del></p>
                                <p class="card-text">8800원</p>
                                <p class="card-text">재고수 : 0개</p>
                                <a href="/joo/product/productDetail" class="btn btn-outline-danger col-12 mx-auto">sold out</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col">
                        <div class="card my-3 p-3" style="width: 18rem; cursor:pointer;" OnClick="location.href ='/joo/product/productDetail'">
                            <img src="../static/assets/productImages/008.png" class="card-img-top" alt="eightProduct">
                            <div class="card-body">
                                <h5 class="card-title">8번 상품제목</h5>
                                <p class="card-text"><del>10000원</del></p>
                                <p class="card-text">8800원</p>
                                <p class="card-text">재고수 : 0개</p>
                                <a href="/joo/product/productDetail" class="btn btn-outline-danger col-12 mx-auto">sold out</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col">
                        <div class="card my-3 p-3" style="width: 18rem; cursor:pointer;" OnClick="location.href ='/joo/product/productDetail'">
                            <img src="../static/assets/productImages/009.png" class="card-img-top" alt="nineProduct">
                            <div class="card-body">
                                <h5 class="card-title">9번 상품제목</h5>
                                <p class="card-text"><del>10000원</del></p>
                                <p class="card-text">8800원</p>
                                <p class="card-text">재고수 : 0개</p>
                                <a href="/joo/product/productDetail" class="btn btn-outline-danger col-12 mx-auto">sold out</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 15개 넘어갈 때, 페이지 표시 -->
                <nav aria- label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item"><a class="page-link"
                            href="#" aria-label="Previous"> <span
                                aria-hidden="true">&laquo;</span>
                        </a></li>
                        <li class="page-item"><a class="page-link"
                            href="#">1</a></li>
                        <li class="page-item"><a class="page-link"
                            href="#">2</a></li>
                        <li class="page-item"><a class="page-link"
                            href="#">3</a></li>
                        <li class="page-item"><a class="page-link"
                            href="#" aria-label="Next"> <span
                                aria-hidden="true">&raquo;</span>
                        </a></li>
                    </ul>
                </nav>
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