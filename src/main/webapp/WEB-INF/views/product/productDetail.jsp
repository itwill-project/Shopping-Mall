<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
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
            <h3 class="text-center">제품 상세보기</h3>
            </header>

            <main class="text-bg-dark p-3 my-2">

                <!-- main head : 사진과, 결제창 -->
                <div class="container text-center">
                <div class="row">

                    <!-- 이미지 영역 -->
                    <div class="col-md-8">
                        <div>
                        <img src="../static/assets/porducts/name1/1.png" class="img-fluid" alt="headImage">
                        </div>
                    </div>

                    <!-- 결제/상세 설명 영역 -->
                    <div class="col-6 col-md-4">

                        <h1><strong>-제품이름-</strong></h1>
                        <div>-제품설명- 소주는 옹기숙성을 거친 감압 증류방식으로 탄생한 전통 증류식 소주입니다.</div>
                        <hr/>
                        <div class="dropdown-center">

                            <select class="form-select form-select-sm"
                                aria-label=".form-select-sm example">
                                <option selected>[필수]옵션을 선택해 주세요</option>
                                <option value="1">선택지1 - 금액 원</option>
                                <option value="2">선택지2 - 금액 원</option>
                                <option value="3">선택지3 - 금액 원</option>
                            </select>

                            <div>
                                <!-- 옵션 클릭시 제품이 추가되는 부분 -->
                                <hr/>
                                옵션추가시 상품이 추가될 부분
                                <hr/>
                            </div>

                            <div class="d-grid gap-2 d-md-block">
                                <button class="btn btn-primary"
                                    type="button">주문하기</button>
                                <button class="btn btn-primary"
                                    type="button">장바구니</button>
                            </div>
                        </div>

                    </div>



                </div>
                </div>
                <!-- main body : 사진으로 된 설명 페이지-->
                <div class="mainBody">
                    <hr/>

                    <div>
                        <img src="../static/assets/porducts/name1/2.png" class="rounded mx-auto d-block" alt="bodyImage">
                    </div>

                </div>

                <!-- main foot : 약관및 기타 정보(배송비및 교환환불)사항 -->
                <div class="mainFoot">
                    <hr/>
                    <div>
                        <img src="../static/assets/porducts/add/1.png" class="rounded mx-auto d-block" alt="footImage">
                    </div>                    
                </div>
            </main> 

            <footer class="my-1 p-3 text-bg-dark">
            <!-- 기업정보, 홈 인스타, 페이스북, 등등 필한거 -->
                <h1 class="text-center">풋터</h1>

                <a href="#">home</a>
            </footer>

			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
		</div>
	</body>
</html>