<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<title>JOO</title>
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
                                    class="nav-link"
                                    href="/joo/user/sign">로그인/회원가입</a></li>

                                <li class="nav-item dropdown"><a
                                    class="nav-link dropdown-toggle"
                                    href="#" role="button"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"> 마이페이지 </a>
                                    <ul class="dropdown-menu">
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myPrivate">개인정보
                                                수정</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myGrade">적립금
                                                확인</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myOrder">주문
                                                내역</a></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myQuseries">문의
                                                내역</a></li>
                                        <li><hr
                                                class="dropdown-divider"></li>
                                        <li><a
                                            class="dropdown-item"
                                            href="/joo/user/myBasket">장바구니</a></li>

                                    </ul></li>
                                <!-- 최근본 상품은 모달로 처리 -->
                                <li class="nav-item"><a
                                    class="nav-link" href="">최근본상품</a></li>
                                <li class="nav-item"><a
                                    class="nav-link" href="">문의하기</a></li>
                            </ul>
                            <!-- 검색 페이지 -->
                            <form class="d-flex" role="search"
                                action="/joo/product/productsList">
                                <input class="form-control me-2"
                                    type="search" placeholder="제품 검색"
                                    aria-label="Search" id="searchText">
                                <button class="btn btn-outline-success"
                                    type="submit">search</button>
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
                    <li><a class="dropdown-item"
                        href="/joo/product/productsList">모아보기</a></li>
                    <li><a class="dropdown-item"
                        href="/joo/product/productsList">소주</a></li>
                    <li><a class="dropdown-item"
                        href="/joo/product/productsList">맥주</a></li>
                    <li><a class="dropdown-item"
                        href="/joo/product/productsList">와인</a></li>
                    <li><a class="dropdown-item"
                        href="/joo/product/productsList">양주</a></li>
                </ul></li>
            <li class="nav-item"><a class="nav-link"
                href="/joo/product/productsNewList">신상</a></li>
            <li class="nav-item"><a class="nav-link"
                href="/joo/product/productsHotList">랭킹</a></li>
            <li class="nav-item"><a class="nav-link"
                href="/joo/post/postList">공지사항/이벤트</a></li>
        </ul>

        <main class="my-1 p-5 text-bg-dark">

            <!-- 검색 기능 -->
            <div class="input-group mb-3">

                <span class="input-group-text">JOO</span>
                <div class="form-floating">
                    <input type="text" class="form-control"
                        id="inputSearchWord" placeholder="search" /> <label
                        for="inputSearchWord">제품 이름으로 검색</label>
                </div>

                <input type="submit" class="btn btn-outline-primary"
                    value="검색" id="btnSearch" />

                <button class="btn btn-primary" type="button"
                    id="btnDetailSearch" data-bs-toggle="collapse"
                    data-bs-target="#collapseDetailSearch"
                    aria-expanded="false"
                    aria-controls="collapseDetailSearch">상세검색</button>

            </div>

            <div class="collapse" id="collapseDetailSearch">
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
                                        type="checkbox" role="switch"
                                        id="flexSwitchAllRegion" checked>

                                    <label class="form-check-label"
                                        for="flexSwitchAllRegion"
                                        style="color: black;">전체지역</label>
                                </div>

                                <span class="form-check"> <input
                                    class="form-check-input"
                                    type="checkbox" value="서울"
                                    id="CheckSeoul" checked> <label
                                    class="form-check-label"
                                    for="CheckSeoul"
                                    style="color: black;">서울</label>

                                </span> <span class="form-check"> <input
                                    class="form-check-input"
                                    type="checkbox" value=""
                                    id="CheckGyeonggi" checked>
                                    <label class="form-check-label"
                                    for="CheckGyeonggi"
                                    style="color: black;">경기</label>
                                </span>
                                <div class="form-check">
                                    <input class="form-check-input"
                                        type="checkbox" value=""
                                        id="CheckGangwon" checked>
                                    <label class="form-check-label"
                                        for="CheckGangwon"
                                        style="color: black;">강원</label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input"
                                        type="checkbox" value=""
                                        id="CheckChungcheong" checked>
                                    <label class="form-check-label"
                                        for="CheckChungcheong"
                                        style="color: black;">충청</label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input"
                                        type="checkbox" value=""
                                        id="CheckJeolla" checked>
                                    <label class="form-check-label"
                                        for="CheckJeolla"
                                        style="color: black;">전라</label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input"
                                        type="checkbox" value=""
                                        id="CheckGyeongsang" checked>
                                    <label class="form-check-label"
                                        for="CheckGyeongsang"
                                        style="color: black;">경상</label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input"
                                        type="checkbox" value=""
                                        id="CheckJejoo" checked>
                                    <label class="form-check-label"
                                        for="CheckJejoo"
                                        style="color: black;">제주</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input"
                                        type="checkbox" value=""
                                        id="CheckOther" checked>
                                    <label class="form-check-label"
                                        for="CheckOther"
                                        style="color: black;">기타</label>
                                </div>
                            </div>

                            <!-- 2열 -->
                            <div
                                class="col order-last col-sm-9 bg-light p-1 border row row-cols-2"
                                style="color: white;">
                                <!-- 1행 -->
                                <div  style="color: black;">
                                    도수범위
                                    <br/>
                                    
                                    <label for="minPalc">
                                        최소값 : 
                                    </label>
                                    <input class="form-control" id="minPalc" type="number" placeholder="도수 최소값을 입력해 주세요" value="0"/>
                                    
                                    <label for="maxPalc" >
                                        최대값 : 
                                    </label>
                                    <input class="form-control" id="maxPalc" type="number" placeholder="도수 최소값을 입력해 주세요" value="100"/>
                                </div>
                                    
                                    
                                <!-- 2행 -->
                                <div
                                    class="col-sm-12 bg-dark p-3 border">
                                    <div>카테고리 검색</div>
                                    <div class="btn-group" role="group"
                                        aria-label="Basic checkbox toggle button group">

                                        <input type="checkbox"
                                            class="btn-check"
                                            id="categoryOld"
                                            autocomplete="off" checked>
                                        <label
                                            class="btn btn-outline-primary"
                                            for="categoryOld">전통주</label>

                                        <input type="checkbox"
                                            class="btn-check"
                                            id="categorSojo"
                                            autocomplete="off" checked>
                                        <label
                                            class="btn btn-outline-primary"
                                            for="categorSojo">소주</label>

                                        <input type="checkbox"
                                            class="btn-check"
                                            id="categoryBear"
                                            autocomplete="off" checked>
                                        <label
                                            class="btn btn-outline-primary"
                                            for="categoryBear">맥주</label>

                                        <input type="checkbox"
                                            class="btn-check"
                                            id="categoryWine"
                                            autocomplete="off" checked>
                                        <label
                                            class="btn btn-outline-primary"
                                            for="categoryWine">와인</label>

                                        <input type="checkbox"
                                            class="btn-check"
                                            id="categoryOther"
                                            autocomplete="off" checked>
                                        <label
                                            class="btn btn-outline-primary"
                                            for="categoryOther">기타</label>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <br />

            <nav class="nav nav-pills nav-justified">
                <a id="aNewList" class="nav-link active">신상</a> <a
                    id="aHotist" class="nav-link" href="#">인기</a> <a
                    id="aOldList" class="nav-link" href="#">전통주</a> <a
                    id="aSojuList" class="nav-link" href="#">소주</a> <a
                    id="aBearList" class="nav-link" href="#">맥주</a> <a
                    id="aAnotherList" class="nav-link" href="#">기타</a>
            </nav>

            <!-- 버튼이 눌렸을때 하단의 selectedCategory 초기화, 해당하는 리스트 보여주기 -->
            <hr />
            <div class="d-none" id="divSearchWord" >
                검색어 : <span id="spanSearchWord" ></span>
            </div>
            <br/>
            <div id="selectedCategory"
                class="row row-cols-1 row-cols-md-5 g-4"></div>

        </main>

        <footer class="my-1 p-3 text-bg-dark">
            <!-- 기업정보, 홈 인스타, 페이스북, 등등 필한거 -->
            <h1 class="text-center">풋터</h1>
            <a href="">home</a>
        </footer>
        <script
            src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
            crossorigin="anonymous"></script>
        <script src="../static/js/productListPage/ProductListPage.js"></script>
    </div>
</body>
</html>