<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<title>JOO</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
    <div>
        <header class="my-1 p-3 text-bg-dark">
            <div>
                <nav class="navbar navbar-expand-lg bg-secondary">
                    <div class="container-fluid">
                        <!-- 홈과 로고클릭시 메인페이지로 이동 -->
                        <a class="navbar-brand" href="/joo/">로고</a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/joo/">Home</a></li>

                                <!-- TODO : 로그인 회원가입 링크로 이동(로그인상태일때 비가시화) -->
                                <li class="nav-item"><a class="nav-link" href="/joo/user/sign">로그인/회원가입</a></li>

                                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 마이페이지 </a>
                                    <ul class="dropdown-menu">

                                        <li><a class="dropdown-item" href="/joo/user/myPrivate">개인정보 수정</a></li>
                                        <li><a class="dropdown-item" href="/joo/user/myGrade">적립금 확인</a></li>
                                        <li><a class="dropdown-item" href="/joo/user/myOrder">주문 내역</a></li>
                                        <li><a class="dropdown-item" href="/joo/user/myQuseries">문의 내역</a></li>

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
                                            href="/joo/user/myQuseries">문의 내역</a></li>

                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item" href="/joo/user/myBasket">장바구니</a></li>

                                    </ul></li>
                                <!-- 최근본 상품은 모달로 처리 -->
                                <li class="nav-item"><a class="nav-link" href="">최근본상품</a></li>
                                <li class="nav-item"><a class="nav-link" href="">문의하기</a></li>
                            </ul>
                            <!-- 검색 페이지 -->
                            <form class="d-flex" role="search" action="/joo/product/productsList">
                                <input class="form-control me-2" type="search" placeholder="제품 검색" aria-label="Search" id="searchText">
                                <button class="btn btn-outline-success" type="submit">search</button>
                            </form>
                        </div>
                    </div>
                </nav>
            </div>
            <h3 class="text-left">주문 내역 조회</h3>
        </header>

        <div class="order-filter">
            <div class="order-filter-period">
                <div class="order-filter-period__tab">
                    <button type="button" class="order-filter-period__tab__button" data-period="1year" onClick="OrderFilter.setPeriod('1year');">1주일</button>
                    <button type="button" class="order-filter-period__tab__button" data-period="1week" onClick="OrderFilter.setPeriod('1week');">1개월</button>
                    <button type="button" class="order-filter-period__tab__button" data-period="1month" onClick="OrderFilter.setPeriod('1month');">3개월</button>
                    <button type="button" class="order-filter-period__tab__button" data-period="3month" onClick="OrderFilter.setPeriod('3month');">6개월</button>
                </div>
                <div class="order-filter-period__date">
                    <div class="order-filter-period__input-wrap">
                        <input type="date" class="order-filter-period__input" name="dt_fr_input" value="" placeholder="-" onchange="checkDateFormat(this);">
                    </div>
                    <div class="order-filter-period__input-wrap">
                        <input type="date" class="order-filter-period__input" name="dt_to_input" value="" placeholder="-" onchange="checkDateFormat(this);">
                    </div>
                </div>
            </div>
            <button type="button" class="order-filter-confirm" onclick="search();">조회하기</button>
        </div>

        <table class="n-table table-col n-order-view" width="100%">
            <colgroup>
                <col style="width: *">
                <col style="width: 14.2%">
                <col style="width: 14.2%">
                <col style="width: 14.2%">
                <col style="width: 10.2%">
                <col style="width: 11%">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">상품정보</th>
                    <th scope="col">수량</th>
                    <th scope="col">금액</th>
                    <th scope="col">주문일자</th>
                    <th scope="col" colspan="2">주문 상태</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td>
                        <div class="n-prd-row">
                            <a href="/joo/product/productDetail" class="img-block"> <img src="https://cdn.econovill.com/news/photo/202305/613036_551446_335.png" alt="전통주 1번" width="100">
                            </a>전통주
                        </div>
                    </td>
                    <td>1</td>
                    <td>
                        <a href="/joo/product/productDetail">KRW 10,000</a>
                    </td>
                    <td>2023.05.31</td>                   
                    <td class="txt-lighter">
                        <div class="btn-set btn-parents">
                            <!-- 클레임 없음 -->

                            구매 완료
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>

        <footer class="my-1 p-3 text-bg-dark">
            <!-- 기업정보, 홈 인스타, 페이스북, 등등 필한거 -->
            <h1 class="text-center">풋터</h1>

            <a href="">home</a>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </div>
</body>
</html>